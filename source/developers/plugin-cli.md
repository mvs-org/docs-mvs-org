title: Register MIT
comments: false
---

## Summary
You can extend the Metaverse wallet functionality by creating your own plugins. Also you can use other third party plugins or share your own with others. To make the creation and development of plugins even easier we created a CLI tool that can help you to get started.

## Installation
First you need to install node.js. Then you can install the CLI tool using the following command:

```bash
sudo npm i -g mvs-plugin-cli
```

Then you can use the `mvs-plugin-api` command globally.

## Get started

To create a new project you can use the `init` command.

```bash
mvs-plugin-cli init hello-world
```

This command will create a new folder `hello-world` and guide you through some questions to generate a config file. Your project should now have the following structure:

```bash
hello-world
 - config.json
 - index.html
```

Now go to your project folder using `cd hello-world` .

![plugininstall](https://i.imgur.com/ZR6yTsX.gif)

## Run

The easiest way to run your new project is by using the built-in server:

```bash
mvs-plugin-cli serve --port 8080
```

You should see a message that your server has been started and you can access the server at http://127.0.0.1:8080.

If you access it just from your browser it will indicate you that it has not been opened within the Metaverse Lightwallet.

![frombrowser](https://i.imgur.com/zXvhZIL.png)

You can also make use of this detection and make the same URL accessible for regular users using their browser. For example you could have a read-only version of your plugin.

## Start within Lightwallet

Open your wallet in testnet mode and go to Settings. You should have the option to add an external plugin. Next enter the path to the config.json file. By default it should be located at http://127.0.0.1:8080/config.json.

Next you should see the information page for your plugin and the permissions it requests. After you accept the plugin you should have a new item in your menu.

If you open the plugin you should see the same website as you visited previously directly in your browser but now it should indicate that it is connected to a wallet.


![fromlightwallet](https://i.imgur.com/RI13Pxi.png)

## Your Code

Now it’s time for you to add your own code. Just replace the index.html with your own code. You can also have multiple html files or separate your styling and JavaScript files.

To learn about the interaction with the wallet you can see the documentation of the [Lightwallet Plugin API](https://github.com/canguruhh/mvs-plugin-api).

As the plugin feature is still experimental expect the API to get improved quickly and don’t hesitate to request features you need.
