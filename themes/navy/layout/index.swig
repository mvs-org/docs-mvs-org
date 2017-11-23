<header id="banner" class="wrapper">
  <div class="inner">
    <h2 id="banner-title">{{ page.subtitle }}</h2>
    <div id="banner-start">
      <span id="banner-start-command">git clone https://github.com/mvs-org/metaverse</span><a id="banner-start-link" href="docs/"><i class="fa fa-arrow-right"></i></a>
    </div>
    <div id="banner-share">{{ partial('partial/share') }}</div>
  </div>
</header>
<div id="content-wrap">
  <div class="wrapper">
    <div class="inner">
      {{ page.content }}
      <ul id="intro-cmd-wrap">
        <li class="intro-cmd-item">mvsd</li>
        <li class="intro-cmd-item">mvs-cli getnewaccount &lt;account&gt; &lt;passwd&gt;</li>
        <li class="intro-cmd-item">mvs-cli getnewaddress &lt;account&gt; &lt;passwd&gt;</li>
        <li class="intro-cmd-item">mvs-cli send &lt;account&gt; &lt;passwd&gt; &lt;receiver_address&gt; &lt;ETP_bits&gt;</li>
        <li class="intro-cmd-item">mvs-cli gettransaction &lt;tx_id&gt;</li>
      </ul>
      <div id="intro-get-started-wrap">
        <a href="docs/" id="intro-get-started-link">{{ __('index.get_started') }}</a>
      </div>
    </div>
  </div>
</div>
