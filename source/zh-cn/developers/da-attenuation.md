title: MST Conditional Offering
---

# 简介
衰减模型是一种高级锁定机制。衰减模型会锁定一定数量的`MST`资产，然后根据模型类型对应的解锁条例来分批解锁。

`MST`资产的衰减模型结合了`MIP-3`(Digital Assets Secondary Issue), `MIP-7`(Digital Aseets - Lock), 与 `MIP-8`(Digital Aseets - Unlock)。该衰减模型提供了许多可调整的参数以满足用户多样的锁定需求。

参考： [MIPS](https://github.com/mvs-org/mips/issues/7)。

# 使用
* 哪些命令支持使用衰减模型？
    命令 `issue`、`secondaryissue`、`[did]sendasset`以及`[did]sendassetfrom`通过选项参数`-m [--model]`支持使用衰减模型。
* 如何查询资产锁定的情况？
    命令 `getaccountasset` 和 `getaddressasset`可查询资产锁定的数量，对应的输出项为：**locked_quantity**。
* 如何查看衰减模型参数？
    命令 `gettx` 和 `lsittxs` 的 `json` 格式输出中可以查看衰减模型参数，对应的输出项为：**attenuation_model_param**。
* 锁定的资产是如何被解锁的？
    锁定的资产是根据块高来解锁的。无需手动解锁，如果当前块高超过锁定块高，被锁定的资产会自动解锁。

# 衰减模型类型
1. 定量解锁类型 ( `TYPE = 1` )
> 该模型会根据固定的数量与块高间隔来解锁。  
> 最后一期解锁的数量与间隔是所有剩余未被解锁的数量与间隔，该数值可能会与固定的解锁数量或间隔不相等。  

2. 用户自定义类型 ( `TYPE = 2` )
> 该模型根据用户提供的锁定块高与数量列表来解锁。  

3. 固定通胀率解锁类型 ( `TYPE = 3` )
> 该模型根据固定的通胀率来解锁。

# 模型参数格式
1. = (等于号) 用于组合`key`与`value`对；
2. ; (分号) 用于分隔`key-value`对；
3. , (逗号) 用于分隔列表参数.
4. 模型参数的`key`被严格限定如下：
    定量解锁类型, `key`只能为 `PN, LH, TYPE, LQ, LP, UN`；
    用户自定义类型, `key`只能为  `PN, LH, TYPE, LQ, LP, UN, UC, UQ`；
    固定通胀率解锁类型, `key`只能为  `PN, LH, TYPE, LQ, LP, UN, IR`；
    其中，`PN` 与 `LH` 无需用户提供，这两个`key`会由节点自动生成并调整对应的值。
    启动
5. `key`的含义
    ```
    为了方便统一衰减模型的计算公式，我们定义了如下缩写变量：
    IQ：资产总数量，必须为大于 0 的整数  
    LQ：锁定的总数量，必须为大于 0 的整数  
    LP：锁定的总间隔，单位为块高，必须为大于 0 的整数  
    UC_t：第 t 期的解锁间隔，单位为块高  
    UQ_t: 第 t 期的解锁数量  
    IR_t: 第 t 期的通胀率  
    ```

6. 缩写变量解释：

|  模型参数名字         | 缩写  | 含义                                | 
|  -------------------  | ----- | ------------------------------------| 
|  current_period_nbr        |  PN   |   当前解锁期的索引，从0开始 |
|  next_interval             |  LH   |   当前解锁期解锁间隔，单位为块高 |
|  type                      |  TYPE |   模型参数类型 |
|  lock_quantity             |  LQ   |   锁定的总数量 |
|  lock_period               |  LP   |   锁定的总间隔 |
|  inflation_rate            |  IR   |   通胀率 |
|  total_period_nbr          |  UN   |   锁定的总期数 |
|  custom_lock_number_array  |  UC   |   用户自定义的每期锁定间隔数组 |
|  custom_lock_quantity_array|  UQ   |   用户自定义的每期锁定数量数组 |

# 模型参数值的约束
* 定量解锁类型
```
    TYPE=1,
    UN>0,
    LQ<=IQ
    LQ>=UN
    LP>=UN
```
* 用户自定义类型
```
    TYPE=2,
    UN>0, UN<=100
    LQ<=IQ
    数组 UC 和 UQ 的大小必须等于 UN。
    LQ = UQ 数组的总和
    LP = UC 数组的总和
```
* 固定通胀率解锁类型
```
    TYPE=3,
    UN>0, UN<=100
    LQ=IQ
    LQ>=UN
    LP>=UN
    IR>0, IR<=100000
```

# 示例
* 定量解锁类型
    **用户输入: "TYPE=1;LQ=9001;LP=60001;UN=3"**
```
    "attenuation_model_param" : 
    {
        "current_period_nbr" : 0,
        "lock_period" : 60001,
        "lock_quantity" : 9001,
        "next_interval" : 20000,
        "total_period_nbr" : 3,
        "type" : 1
    },
```
```
    该模型参数表示总数量为 9001 (lock_quantity) 的资产将在 60001 (lock_period) 个块高之后被完全被完全解锁。
    这些资产将分 3 (total_period_nbr) 期按照固定数量与块高间隔解锁。
    我们通过公式 **UC=lock_period/total_period_nbr** 与 **UQ=lock_quantity/total_period_nbr** 计算出每一期的解锁数量与锁定间隔。
        UC=60001/3=20000， UQ=9001/3=3000，因此：
    * 第0期(**current_period_nbr=0;next_interval=20000**)，锁定间隔：20000，锁定数量： 3000,
    * 第1期(**current_period_nbr=1;next_interval=20000**)，锁定间隔：20000，锁定数量： 3000,
    * 第2期(**current_period_nbr=1;next_interval=20001**)，锁定间隔：20001，锁定数量： 3001, 最后一期总是包括所有剩余的锁定块高与数量。
```

* 用户自定义类型
    **用户输入: "TYPE=2;LQ=9001;LP=60001;UN=3;UC=20000,20000,20001;UQ=3000,3000,3001"**
```
    "attenuation_model_param" : 
    {
        "current_period_nbr" : 0,
        "lock_period" : 60001,
        "lock_quantity" : 9001,
        "locked" : 
        [
            {
                "number" : 20000,
                "quantity" : 3000
            },
            {
                "number" : 20000,
                "quantity" : 3000
            },
            {
                "number" : 20001,
                "quantity" : 3001
            }
        ],
        "next_interval" : 20000,
        "total_period_nbr" : 3,
        "type" : 2
    },
```
```
    该模型参数的效果与定量解锁类型示例完全一致，只不过是由用户自己输入锁定间隔与数量参数数组实现的。
```

* 固定通胀率解锁类型
    **用户输入: "TYPE=3;LQ=1000000000;LP=12000;UN=12;IR=50"**
```
    "attenuation_model_param" : 
    {
        "current_period_nbr" : 0,
        "inflation_rate" : 50,
        "lock_period" : 12000,
        "lock_quantity" : 1000000000,
        "locked" : 
        [
            {
                "number" : 1000,
                "quantity" : 11561019
            },
            {
                "number" : 1000,
                "quantity" : 5780509
            },
            {
                "number" : 1000,
                "quantity" : 8670764
            },
            {
                "number" : 1000,
                "quantity" : 13006146
            },
            {
                "number" : 1000,
                "quantity" : 19509219
            },
            {
                "number" : 1000,
                "quantity" : 29263828
            },
            {
                "number" : 1000,
                "quantity" : 43895742
            },
            {
                "number" : 1000,
                "quantity" : 65843613
            },
            {
                "number" : 1000,
                "quantity" : 98765420
            },
            {
                "number" : 1000,
                "quantity" : 148148130
            },
            {
                "number" : 1000,
                "quantity" : 222222195
            },
            {
                "number" : 1000,
                "quantity" : 333333415
            }
        ],
        "next_interval" : 1000,
        "total_period_nbr" : 12,
        "type" : 3
    },
```
```
    该模型参数表示总数量 1000000000 (lock_quantity) 的资产将在 12000 (LP) 个块高之后被完全解锁。
    这些资产将分 12 (total_period_nbr) 期按照固定通胀率 50% 解锁，每一期的锁定数量与间隔分别由 locked 数组给出。
```