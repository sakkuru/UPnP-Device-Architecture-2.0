---
layout: default
title: Presentation API
date: 2015-05-04
---

# Presentation API

Editor's Draft 18 March 2015

## 概要

本仕様はWebコンテンツに外部プレゼンテーションタイプのディスプレイにアクセスし、Webコンテンツを表示することを可能にするAPIを定義する。

## 本ドキュメントの状態

略

<!-- 
This section describes the status of this document at the time of its publication. Other documents may supersede this document. A list of current W3C publications and the latest revision of this technical report can be found in the W3C technical reports index at http://www.w3.org/TR/.
 -->

<!-- 
This document was published by the Second Screen Presentation Working Group as an Editor's Draft. If you wish to make comments regarding this document, please send them to public-secondscreen@w3.org (subscribe, archives). All comments are welcome.
 -->

<!-- 
This document is a work in progress and is subject to change. It builds on the final report (dated 18 November 2014) produced by the Second Screen Presentation Community Group. Algorithms have been drafted in particular. Most sections are still incomplete or underspecified. Privacy and security considerations are missing. A few open issues are noted inline. Please check the group's issue tracker on GitHub for an accurate list. Feedback from early experimentations is encouraged to allow the Second Screen Presentation Working Group to evolve the specification based on implementation issues.
 -->

<!-- 
Publication as a First Public Working Draft does not imply endorsement by the W3C Membership. This is a draft document and may be updated, replaced or obsoleted by other documents at any time. It is inappropriate to cite this document as other than work in progress.
 -->

<!-- 
This document was produced by a group operating under the 5 February 2004 W3C Patent Policy. W3C maintains a public list of any patent disclosures made in connection with the deliverables of the group; that page also includes instructions for disclosing a patent. An individual who has actual knowledge of a patent which the individual believes contains Essential Claim(s) must disclose the information in accordance with section 6 of the W3C Patent Policy.
 -->

<!-- 
This document is governed by the 1 August 2014 W3C Process Document.
 -->


## 1. 導入

本セクションは非規範的である。

本仕様はプロジェクタや接続されたTVなどのセカンダリディスプレイに、Webを利用できるようにすることを目的としている。有線（HDMI, DVI等）および無線技術(MiraCast, Chromecast, DLNA, AirPlay等)で接続されているディスプレイを考慮に入れる。

<!--
Devices with limited screen size lack the ability to show content to a larger audience, for example a group of colleagues in a conference room, or friends and family at home. Showing content on an external large display helps to improve the perceived quality and impact of the presented content.
-->

限られたスクリーンサイズのデバイスは、多くの聴衆に向けてのコンテンツ表示能力に欠ける。例えばカンファレンスルームでの同僚グループや、宅内での友人や家族などである。
外部の大きなディスプレイへのコンテンツ表示は、表示コンテンツの認識の質やインパクトを向上させる。

<!--
At its core, this specification enables an exchange of messages between a requesting page and a presentation page shown in the secondary display. How those messages are transmitted is left to the UA in order to allow for use of display devices that can be attached in a wide variety of ways. 
For example, when a display device is attached using HDMI or MiraCast, the UA on the requesting device can render the requested presentation page in that same UA, 
but instead of displaying in a window on that same device, it can use whatever means the operating system provides for using those external displays. In that case, both the requesting page and the presentation page run on the requesting device and the operating system is used to route the presentation display output to the other display device. The second display device doesn't need to know anything about this spec or that the content involves HTML5.
-->

中核として、本仕様はリクエストを送るページとセカンダリディスプレイに表示されるページとの間でメッセージ交換を可能にする。
さまざまな方法で接続されているディスプレイデバイスを使用できるようにするため、どのようにメッセージが送信されるかはUAに委ねられる。
例えば、ディスプレイデバイスがHDMIやMiraCastで接続されている場合、リクエストを送信するデバイス上のUAは、同じUA上でリクエストされたページを表示できる。
また同じデバイス上のウィンドウで表示する代わりに、OSが提供する外部ディスプレイを使うためのどんな方法でも使うことができる。
この場合、リクエストを送るページも表示されるページもリクエストを送るデバイスで動いていて、OSはディスプレイ出力を他のディスプレイデバイスに送るために使われる。
セカンドディスプレイデバイスは、本仕様やコンテンツがHTML5を含むことについて知る必要は無い。

<!-- Alternately, some types of external displays may be able to render HTML5 themselves and may have defined their own way to send messages to that content. In that case, the UA on the requesting device would not need to render the presentation page itself. Instead, the UA could act as a proxy translating the request to show a page and the messages into the form understood by the display device.
 -->

代わりに、いくつかのタイプの外部ディスプレイは、それ自身でHTML5を表示できるかもしれない。
さらに、メッセージをそのコンテンツに対して送る手段を持っているかもしれない。
この場合、リクエストを送るデバイス上のUAは、表示したいページをそれ自身で表示する必要がない。
その代わりUAは、ページを表示するためのリクエクストとメッセージを、ディスプレイデバイスが理解できる形へ変換するプロキシとして動作するだろう。

<!-- 
This way of attaching to displays could be enhanced in the future through definition of a standard protocol for delivering these types of messages that display devices could choose to implement.
 -->

このディスプレイへ接続する方法は、ディスプレイデバイスが実装を選択するメッセージを送信するための標準プロトコルの定義により、将来的に改善・強化されるだろう。

本APIは上記の方法のいずれかでディスプレイデバイスと接続されているUAで使用されることを意図している。



## 2 ユースケースと要件

### 2.1 ユースケース

#### プレゼンテーション

<!-- 
A user is preparing a set of slides for a talk. Using a web based service, she is editing her slides and speaker notes on the primary screen, while the secondary larger screen shows a preview of the current slide. When the slides are done, her mobile phone allows her to access them from an online service while on the go. Coming to the conference, using wireless display technology, she would like to present her slides on the stage screen from her mobile phone. The phone's touch screen helps her to navigate slides and presents a slide preview, while the projector shows her slides to the audience.
 -->

あるユーザが講演用のスライドを用意する。
彼女は大きいセカンドスクリーンに現在のスライドのプレビューを表示させながら、
Webベースのサービスを使ってスライドとスピーカーメモを編集する。
スライドが完成したとき、彼女の携帯電話は外出中オンラインサービスからそれらへアクセスを可能にする。
カンファレンスに来て、無線ディスプレイ技術を使用して、彼女は携帯電話からスライドをステージスクリーンに表示したいと思う。
プロジェクタがスライドを聴衆に見せる間、電話のタッチスクリーンはスライドをナビゲートし、スライドプレビューを表示することを助ける。

#### ビデオ・画像共有

<!-- 
Using an online video or image sharing service, a user would like to show memorable moments to her friends. Using a device with a small screen, it is impossible to show the content to a large group of people. Connecting an external TV screen or projector to her device - with a cable or wirelessly - the online sharing service now makes use of the connected display, allowing a wider audience to enjoy the content. The web page shows UI elements that allow the user to trigger displaying content on the secondary display (e.g a "send to second screen" ) only if there is at least one secondary screen available.
 -->

オンラインビデオ・画像共有サービスを使って、あるユーザは記憶したい瞬間を友人たちに見せたいと思う。
小さなスクリーンのデバイスでは、大勢の人間にコンテンツを見せることは不可能である。
外部TVスクリーンやプロジェクタをデバイスへ接続(有線もしくは無線で)すると、オンライン共有サービスは接続されたディスプレイを使えるようになり、多くの聴衆がコンテンツを楽しめるようになる。
少なくとも一つのセカンドスクリーンが使用可能なときだけ、Webページはユーザがコンテンツをセカンドディスプレイに表示開始できるUI要素を表示する。

#### マルチプレイヤーゲーム
<!-- 
Splitting the gaming experience into a near screen controller and a large screen visual experience, new gaming experiences can be created. Accessing the local display on the small screen device and an external larger display allows for richer web-based gaming experiences.
 -->

ゲームエクスペリエンスを近くのスクリーンコントローラと大きなスクリーンビジュアル経験に分けることで、
新しいゲーム経験は作られるだろう。
小さなスクリーンデバイス上のローカルディスプレイと、大きな外部ディスプレイににアクセスすることは、よりリッチなWebベースのゲームエクスペリエンスをもたらす。

#### 複数スクリーンへのメディア表示

<!-- 
Alice enters a video sharing site using a browser on her tablet. Next, Alice picks her favorite video from the site, and the video starts to play on her tablet. While the video is playing Alice clicks a button "Share on different screen". The browser provides a user interface that lists all the screens Alice has around her home, asking her to select one. The screens are identified by names that are familiar to Alice. Alice picks one screen from the list, "Alice's big TV", and the video playback continues seamlessly on the selected screen. Next she decides to switch the playback to a different screen. She clicks the same button "Share on different screen" provided by the site, and the browser presents the user interface that lists all the screens. Alice picks another screen from the list, "Alice's kitchen TV", and the playback resumes on that screen. Video site also provides a feature to see the action (Alice is watching a soccer game) from different angle. Alice clicks a button "Select screen for additional angle", and the browser asks Alice similarly to select the screen to be used for playback. Alice picks "Alice's Projector" and the soccer game is shown on the projector from a different angle, in parallel to the content being played back on "Alice's kitchen TV".
 -->

アリスはタブレットのブラウザからビデオ共有サイトにアクセスする。
次にアリスは彼女のお気に入りのビデオをサイトから選択すると、彼女のタブレットでビデオが流れる。
ビデオが流れている間に、アリスが「別のスクリーンで共有」ボタンをクリックする。
ブラウザは、アリスの家にあるすべてのスクリーンをリストアップしたユーザ・インタフェースを表示し、彼女にどれか一つを選択するよう問う。
スクリーンはアリスにとって馴染みのある名前で識別される。
アリスはリストから一つのスクリーン、『アリスの大きいテレビ』を選ぶと、ビデオは選択されたスクリーンでシームレスに続けて再生される。
次に彼女は再生スクリーンを切り替えることを決める。
彼女がサイトにある同じボタン「別のスクリーンで共有」でクリックすると、ブラウザはすべてのスクリーンのリストしたユーザインタフェースを表示する。
アリスはリストから別のスクリーン「アリスのキッチンのTV」を選択すると、そのスクリーンで再生が始まる。
ビデオサイトはまた、(アリスがサッカーの試合を見ているとき)異なるアングルからアクションを見る機能を提供する。
アリスが『他のアングル用のスクリーンを選択』ボタンをクリックすると、ブラウザは同様にアリスに再生用のスクリーンを選択するよう尋ねる。
アリスは「アリスのプロジェクタ」を選択すると、「アリスのキッチンのTV」で再生されているコンテンツと並行して、別のアングルのサッカーの試合がそのプロジェクタから表示される。


### 2.2 要件

<!-- 
The requirements enumerated in this section are derived from the use cases.
 -->

本セクションで列挙された要件は、ユースケースから派生している。

#### 2.2.1 機能要件

##### 検出・可用性

<!-- 
The UA must provide a way to find out whether at least one secondary screen is available.
 -->

UAは、少なくとも一つのセカンダリスクリーンが使用できるかどうかを発見する方法を提供しなければならない。

##### プレゼンテーションの開始

<!-- 
The UA must provide a means of start sending content to the secondary screen.
 -->

UAはセカンドディスプレイへコンテンツ送信を開始する方法を提供しなければならない。

##### プレゼンテーションの再開

<!-- 
The UA must be able to resume an existing session with content being displayed on the secondary screen.
 -->

UAはセカンドディスプレイに表示されているコンテンツの既存のセッションの再開が出来なければならない

##### 通信

<!-- 
The UA must enable exchanging data between the primary and the secondary screen in order to have a control channel between the primary and secondary page. The UA must not make assumptions about the the execution locality of the user agent of the remote page it communicates with (i.e. the secondary page might run on a remote user agent and thus the link between the two pages' UA must be loosely coupled).
 -->

UAはプライマリとセカンダリページの間でコントロールチャネルを持つために、プライマリとセカンダリスクリーンの間でデータ交換を可能にしなければならない。
UAは自身が通信しているリモートページのUAの実行局地性について憶測を立ててはならない（例：セカンダリページはリモートUA上で動いているだろう、だから2つのページのUA間は疎結合に違いない）

##### シグナリング切断

<!-- 
The UA must signal disconnection from the presentation page to the primary page and vice versa.
 -->

UAは表示ページから開始ページへ(その逆も)、切断信号を送れなければならない。


#### 2.2.2 非機能要件

##### パワーセーブフレンドリー
<!-- 
All API design decisions must be analyzed from a power efficiency point of view. Especially when using wireless display technologies or querying availability over a radio channel, care needs to be taken to design the API in a way that does not pose obstacles to using radio resources in an efficient way. For example, powering up the wireless display detection only when needed.
 -->

すべてのAPI設計決定はパワー効率性の観点から分析されなければならない。
特に無線表示技術を使用するときや、無線チャネル上で可用性の問い合わせをするとき、
APIは効率的な方法での無線リソースの使用に障害とならない方法で設計されるよう注意する必要がある。


## 3 適合性

略

## 4 用語

略

## 5 例

<!-- 
This section shows example codes that highlight the usage of main features of the Presentation API. In these examples, controller.html represents the controlling page that runs in the opener user agent and presentation.html represents the presenting page that runs in the presenting user agent. Both pages are served from the domain http://example.org (http://example.org/controller.html and http://example.org/presentation.html). Please refer to the comments in the code examples for further details.
 -->

本セクションでは、Presentation APIの主な特徴の使用を強調したサンプルコードを紹介する。
これらの例では、controller.htmlはオープナーUAで動くコントロールページを表し、presentation.htmlはプレゼン用UAで動作するプレゼンテーションページを表す。
どちらのページもhttp://example.orgドメイン(http://example.org/controller.htmlとhttp://example.org/presentation.html)にホストされる。
詳細はコード中のコメントを参照。


### 5.1 プレゼンテーションディスプレイの可用性監視

```
<!-- controller.html -->
<button id="castBtn" style="display: none;">  </button>
<script>
  // castボタンは、少なくともひとつのプレゼンテーションディスプレイが使用可能なときにvisibleとなる
  var castBtn = document.getElementById("castBtn");
  // availablechangeイベントは、プレゼンテーションディスプレイの可用性が変化した時発火する
  navigator.presentation.onavailablechange = function(evt){
    // ディスプレイの可用性に応じてcastボタンはshowかhideとなる
    castBtn.style.display = evt.available? "inline" : "none";
  }
</script>
```

### 5.2 新規プレゼンテーションセッションの開始

```
<!-- controller.html -->
<script>
  // 相対URLも使用可能 例: "presentation.html"
  var presUrl = "http://example.com/presentation.html";
  // ランダムpresIdを生成
  var presId = Math.random().toFixed(6).substr(2);
  // 新規セッションの開始。presIdはオプショナル。
  // 成功時は新規開始セッションがsetSessionに渡される。エラーのときはnullが渡される。
  navigator.presentation.startSession(presUrl, presId).then(setSession).catch(function(e){
    // ユーザが選択ダイアログをキャンセルしたか、エラーが発生した場合
    setSession(null);
  });
</script>
```

### 5.3 プレゼンテーションセッションへの参加

```
<!-- controller.html -->
<script>
  // もしあればlocalStorageからpresIdから読み込む
  var presId = localStorage && localStorage["presId"] || null;
  // presIdはjoinSessionに必須である。
  // 成功時はjoinしたセッションがsetSessionに渡される。エラーの時はnullが渡される。
  presId && navigator.presentation.joinSession(presUrl, presId).then(setSession).catch(function(e){
    // presUrl、presIdに対応するセッションがなかったか、エラーが発生した場合
    setSession(null);
  });
</script>
```

### 5.4 セッション情報の監視とデータ交換

```
<!-- controller.html -->
<script>
  var session;
  var setSession = function(theSession){
    // もしあれば古いセッションをcloseする
    session && session.close();
    // もしあればlocalStorageから古いpresIdを削除する
    localStorage && delete localStorage["presId"];
    // 新規セッションを設定する
    session = theSession;
    if(session){
      // localStorageにpresIdを保存する
      localStorage && localStorage["presId"] = session.id;
      // セッション状態を監視
      session.onstatechange = function(){
        if(this == session && this.state == "disconnected")
          setSession(null);
      };
      // メッセージハンドラを登録
      session.onmessage = function(msg){
        console.log("receive message",msg);
      };
      // プレゼンテーションページにメッセージを送信
      session.postMessage("say hello");
    }
  };
</script>
<!-- presentation.html -->
<script>
  var session = navigator.presentation.session;
  session.onstatechange = function(){
    // session.state is either 'connected' or 'disconnected'
    // session.stateは'connected'か'disconnected'
    console.log("session's state is now", session.state);
  };
  session.onmessage = function(msg){
    if(msg == "say hello")
      session.postMessage("hello");
  };
</script>
```

## 6 API

### 6.1 共通の単語
<!-- 
A presentation display refers to an external screen available to the user agent via an implementation specific connection technology.
 -->

<b>プレゼンテーションディスプレイ</b>は、具体的な接続技術の実装を用いてUAが利用可能な外部ディスプレイを指す。

<!-- 
A presentation is an active connection between a user agent and a presentation display for displaying web content on the latter at the request of the former.
 -->

<b>プレゼンテーション</b>は、UAとプレゼンテーションディスプレイの間の、前者のリクエストに応じて後者にWebコンテンツを表示するためのアクティブな接続である。

<!-- 
A presentation session is an object relating an opening browsing context to its presentation display and enabling two-way-messaging between them. Each such object has a presentation session state and a presentation session identifier to distinguish it from other presentation sessions.
 -->

<b>プレゼンテーションセッション</b>はオープニングブラウジングコンテキストとプレゼンテーションディスプレイを関連付け、また2つの間の双方向メッセージングを可能にするオブジェクトである。
各オブジェクトは<b>プレゼンテーションセッション状態</b>と、他のプレゼンテーションと区別するための<b>プレゼンテーションセッション識別子</b>を持つ。

<!-- 
An opening browsing context is a browsing context that has initiated or resumed a presentation session by calling startSession() or joinSession().
 -->

<b>オープニングブラウジングコンテキスト</b>は、startSession()かjoinSession()の呼び出しにより、プレゼンテーションセッションを開始もしくは再開したブラウジングコンテキストである。

<!-- 
The presenting browsing context is the browsing context responsible for rendering to a presentation display. A presenting browsing context can reside in the same user agent as the opening browsing context or a different one.
 -->

<b>プレゼンティングブラウジングコンテキスト</b>は、プレゼンテーションディスプレイに表示を行う責任があるブラウジングコンテキストである。
プレゼンティングブラウジングコンテキストは、オープニングブラウジングコンテキストや、他のブラウジングコンテキストと同じUA内に存在できる。


### 6.2 共通の定義

<!-- 
Let D be the set of presentations that are currently known to the user agent (regardles of their state). D is represented as a set of tuples (U, I, S) where U is the URL that is being presented; I is an alphanumeric identifier for the presentation; and S is the user agent's PresentationSession for the presentation. U and I together uniquely identify the PresentationSession of the corresponding presentation.
 -->

Dを、UAが現在知っているプレゼンテーション群とする(それら状態は問わない)。
Dは一組のタプル(U,I,S)として表される。
Uは表示されているURL、Iはプレゼンテーション用の英数字の識別子、SはプレゼンテーションのためのUAのPresentationSessionを表す。
UとIは、対応するプレゼンテーションのPresentationSessionを一意的に識別する。


### 6.3 PresentationSessionインタフェース

各プレゼンテーションは、PresentationSessionオブジェクトによって表される。

```
enum PresentationSessionState { "connected", "disconnected" /*, "resumed" */ };
enum BinaryType { "blob", "arraybuffer" };

interface PresentationSession : EventTarget {
  readonly DOMString? id;
  readonly attribute PresentationSessionState state;
  void close();
  attribute EventHandler onstatechange;

  // Communication
  attribute BinaryType binaryType;
  EventHandler onmessage;
  void postMessage (DOMString message);
  void postMessage (Blob data);
  void postMessage (ArrayBuffer data);
  void postMessage (ArrayBufferView data);
};
```

<!-- 
The id attribute holds the alphanumeric presentation session identifier.
 -->

id属性は、英数字のプレゼンテーションセッション識別子を保持する。

<!-- 
The state attribute represents the presentation session's current state. It can take one of the values of PresentationSessionState depending on connection state.
 -->

state属性はプレゼンテーションセッションの現在の状態を表す。
接続状態に応じて、PresentationSessionStateの値のいずれかを取る。

<!-- 
When the postMessage() method is called on a PresentationSession object with a message, the user agent must run the algorithm to post a message through a PresentationSession.
 -->

messageとともにPresentationSessionオブジェクトのpostMessage()メソッドが呼ばれたとき、
UAはPresentationSessionを通してメッセージをポストするためのアルゴリズムを実行しなければならない。

<!-- 
When the close() method is called on a PresentationSession, the user agent must run the algorithm to close a presentation session.
 -->

PresentationSessionオブジェクトのcloseメソッドが呼ばれたとき、UAはプレゼンテーションをクローズするためのアルゴリズムを実行しなければならない。

#### 6.3.1 PresentationSessionを通してのメッセージの送信

<!-- 
Let presentation message data be the payload data to be transmitted between two browsing contexts. Let presentation message type be the type of that data, one of text and binary.
 -->

<b>プレゼンテーションメッセージデータ</b>を2つのブラウジングコンテキストの間で送信されるペイロードデータとする。
<b>プレゼンテーションメッセージタイプ</b>をそのデータの型、textかbinaryのどちらかとする。

<!-- 
When the user agent is to post a message through a PresentationSession S, it must run the following steps:
 -->

UAが<b>PresentationSession Sからメッセージを送信</b>するとき、以下のステップを実行しなければならない:

<!-- 
1. If the state property of PresentationSession is "disconnected", throw an InvalidStateError exception.
2. Let presentation message type messageType be binary if data is one of ArrayBuffer or Blob. Let messageType be text if data is of type DOMString)
3. Assign the destination browsing context as follows:
    1. Let the the destination browsing context be the opening browsing context if postMessage is called in the presenting browsing context.
    2. Let destination browsing context be the presenting browsing context if postMessage is called from the opening browsing context.
4. Using an implementation specific mechanism, transmit the contents of the data argument as presentation message data and presentation message type messageType to the destination browsing context side.
 -->

1. PresentationSessionのstateプロパティが"disconnected"なら、InvalidStateError例外を投げる。

2. もしdataがArrayBufferかBlobなら、プレゼンテーションメッセージタイプ messageTypeをbinaryとする。
もしdataがDOMString型なら、messageTypeをtextとする。

3. <b>あて先ブラウジングコンテキスト</b>を以下のように割り当てる:

    1. postMessageがプレゼンティングブラウジングコンテキスト内で呼ばれたとき、あて先ブラウジングコンテキストをオープニングブラウジングコンテキストとする。

    2. postMessageがオープニングブラウジングコンテキストから呼ばれたとき、あて先ブラウジングコンテキストをプレゼンティングブラウジングコンテキストとする。

4. 具体的なメカニズムの実装を使って、プレゼンテーションメッセージデータとして、data引数のコンテンツとプレゼンテーションメッセージタイプ messageTypeを、あて先ブラウジングコンテキスト側に送信する。


#### 6.3.2 PresentationSessionを使ったメッセージの受信

<!-- 
When the user agent has received a transmission from the remote side consisting of presentation message data and presentation message type, it must run the following steps:
 -->

UAがリモートサイドから、プレゼンテーションメッセージデータとプレゼンテーションメッセージタイプからなるメッセージを受信したとき、以下のステップを実行しなければならない:

<!-- 
1. If the state property of PresentationSession is "disconnected", abort these steps.

2. Let event be a newly created trusted event that uses the MessageEvent interface, with the event type message, which does not bubble, is not cancelable, and has no default action.

3. Initialize event's origin attribute to the Unicode serialization of the URL that the opening browsing context and the presenting browsing context have in common.

4. Initialize the event's data attribute as follows:
    1. If the presentation message type is text, then initialize event's data attribute to the contents of presentation message data of type DOMString.
    2. If the presentation message type is binary, and binaryType is set to blob, then initialise event's data attribute to a new Blob object that represents presentation message data as its raw data.
    3. If the presentation message type is binary, and binaryType is set to arraybuffer, then initialise event's data attribute to a new ArrayBuffer object whose contents are presentation message data.
5. Queue a task to fire event at PresentationSession.
 -->

1. もしPresentationSessionのstateプロパティが"disconnected"なら、これらのステップを中断する。

2. eventを、MessageEventインタフェースを使用する、イベントタイプがmessageの、新たに生成したtrusted eventとする。それはバブルせず、キャンセルできず、デフォルトアクションを持たない。

3. eventのorigin属性を、URLのUnicodeシリアライゼーションで初期化する。
それはオープニングブラウジングコンテキストとプレゼンティングブラウジングコンテキストが共通して持っている。

4. eventのdata属性は以下のように初期化する。

    1. プレゼンテーションメッセージタイプがtextなら、eventのdata属性をDOMString型のプレゼンテーションメッセージデータのコンテンツで初期化する。

    2. プレゼンテーションメッセージタイプがbinaryで、binaryTypeがblobなら、eventのdata属性を新規Blobオブジェクトで初期化する。それは生データとしてプレゼンテーションメッセージデータを表す。

    3. プレゼンテーションメッセージタイプがbinaryで、binaryTypeがarraybufferなら、eventのdata属性を新規ArrayBufferオブジェクトで初期化する。その中身はプレゼンテーションメッセージデータである。

5. PresentationSessionで、eventを発火するタスクをキューイングする。


#### 6.3.3 PresentationSessionのクローズ

<!-- 
When the user agent is to close a presentation session S, it must run the following steps:
 -->

UAが<b>プレゼンテーションセッションSをクローズ</b>するとき、以下のステップを実行しなければならない:

<!-- 
1. If S.state is not connected, then:
    1. Abort these steps.
2. Set S.state to disconnected.
3. Let D be the set of presentations known by the user agent.
4. Queue a task T to run the following steps in order:
    1. For each presentation (U, I, S') in D,
        1. Let u equal U, i equal I, and s equal S'.
        2. If u is equal to S.url and i is equal to S.id, run the following steps:
            1.Queue a task to fire an event named statechange at s.onstatechange.
 -->

1. S.stateがconnectedでないなら:
    1. これらのステップを中断する。

2. S.stateを"disconnected"にセットする。

3. DをUAによって知られているpresentationのセットとする。

4. 以下のステップを順番に実行するよう、タスクTをキューに入れる。

    1. D内の各presentation(U, I, S')に対して、

        1. uをU、iをI、sをS'とする。
        2. uがS.url、iがS.idと等しいなら、以下のステップを実行する:

            1. s.onstatechangeでstatechangeイベントを発火するタスクをキューに入れる。


#### 6.3.4 イベントハンドラ

<!-- 
The following are the event handlers (and their corresponding event handler event types) that must be supported, as event handler IDL attributes, by objects implementing the PresentationSession interface:
 -->

以下のイベントハンドラ(と対応するイベントハンドライベントタイプ)は、PresentationSessionインタフェースを実装するオブジェクトで、イベントハンドラIDL属性としてサポートされなければならない:

Event handler | Event handler event type
---- | ---
onmessage | message
onstatechange | statechange


## 7 NavigatorPresentationインタフェース

```
partial interface Navigator {
  readonly attribute NavigatorPresentation presentation;
};
```

<!-- 
The presentation attribute is used to retrieve an instance of the NavigatorPresentation interface, the main interface of Presentation API.
 -->

presentation属性は、Presentation APIのメインインタフェースであるNavigatorPresentationインタフェースのインスタンスの取得に使われる。

```
interface NavigatorPresentation : EventTarget {
  readonly attribute PresentationSession? session;
  Promise<PresentationSession> startSession(DOMString url, DOMString? presentationId);
  Promise<PresentationSession> joinSession(DOMString url, DOMString? presentationId);
  attribute EventHandler onavailablechange;
};
```

### 7.1 プレゼンテーションセッションの開始

<!-- 
When the startSession(presentationUrl, presentationId) method is called, the user agent must run the following steps:
 -->

startSession(presentationUrl, presentationId)メソッドが呼ばれたとき、UAは以下のステップを実行しなければならない。

#### Input

<!-- 
presentationUrl, the URL of the document to be presented
presentationId, an optional identifier for the presentation
 -->

* presentationUrl : 表示されるドキュメントのURL
* presentationId : プレゼンテーションのためのオプショナルな識別子

#### Output

<!-- 
P, a Promise
 -->

* P : Promise

<!-- 
1. Let P be a new Promise.
2. Return P.
3. If the user agent does not monitor presentation display availability, run the following steps:
    1. Monitor presentation display availability.
    2. Wait until the algorithm completes.
4. If the availableDisplays list is empty, then:
    1. Reject P with a "NoScreensAvailable" exception.
    2. Abort all remaining steps.
5. Queue a task T to request user permission for the use of a presentation display and selection of one presentation display.
    1. If T completes with the user granting permission to use a screen, run the following steps:
        1. If presentationId is not undefined, assign I to that that presentationId.
        2. If presentationId is undefined, let I be a random alphanumeric value of at least 16 characters drawn from the characters [A-Za-z0-9].
        3. Create a new PresentationSession S.
        4. Set S.url to presentationUrl, set S.id to I, and set S.state to disconnected.
        5. Queue a task C to create a new browsing context on the user-selected presentation display and navigate to presentationUrl in it.
            1. If C completes successfully, run the following steps:
                1. Add (S.url, S.id, S) to D.
                2. Resolve P with S.
                3. Establish a presentation connection with S.
            2. If C fails, run the following steps:
                1. Reject P with a "failed" exception.
    2. If T completes with the user denying permission, run the following steps:
        1. Reject P with a "PermissionDenied" exception.
 -->

1. Pを新しいPromiseとする。
2. Pを返す。
3. UAがプレゼンテーションディスプレイの可用性の監視をしていないなら、以下のステップを実行する:
    1. プレゼンテーションディスプレイの可用性を監視する。
    2. アルゴリズムが終わるまで待機する。
4. もしavailableDisplayが空なら:
    1. "NoScreensAvailable"例外とともにPをリジェクトする。
    2. 残りのステップをすべて中断する。
5. プレゼンテーションディスプレイを使用するためのユーザの許可と、一つのプレゼンテーションディスプレイの選択をリクエストするためのタスクTをキューに入れる。
    1. Tがユーザのスクリーンの使用の許可とともに完了したなら、以下のステップを実行する。
        1. presentationIdがundefinedでない場合、IにそのpresentationIdを割りあてる。
        2. presentationIdがundefinedなら、Iを[A-Za-z0-9]から選ばれた少なくとも16文字のランダム英数字の値とする。
        3. 新規PresentationSession Sを生成する。
        4. S.urlをpresentationURL、S.idをI、S.stateをdisconnectedとする。
        5. ユーザが選択したプレゼンテーションディスプレイ上に新規ブラウジングコンテキストを生成し、presentationUrlをその中にナビゲートするタスクCをキューに入れる。
            1. Cが成功で完了した場合、以下のステップを実行する:
                1. Dに(S.url, S.id, S)を追加する。
                2. SでPを解決する。
                3. Sでプレゼンテーションコネクションを確立する。
            2. Cが失敗したら、以下のステップを実行する:
                1. Pを"failed"例外とともにリジェクトする。
    2. Tがユーザの拒否とともに完了したなら、以下のステップを実行する。
        1. Pを"PermissionDenied"例外とともにリジェクトする。


### 7.2 プレゼンテーションセッションへの参加

<!-- 
When the joinSession(presentationUrl, presentationId) method is called, the user agent must run the following steps:
 -->


joinSession(presentationUrl, presentationId)メソッドが呼ばれたとき、UAは以下のステップを実行しなければならない。


#### Input

<!-- 
presentationUrl, the URL of the document being presented
presentationId, the identifier for the presentation
 -->

* presentationUrl : 表示されているドキュメントのURL
* presentationId : プレゼンテーションのためのオプショナルな識別子

#### Output

<!-- 
P, a Promise
 -->

* P : Promise

<!-- 
1. Let P be a new Promise.
2. Return P.
3. Let D be the set of presentations known by the user agent.
4. Queue a task T to run the following steps in order:
    1. For each presentation (U, I, S) in D,
        1. Let u equal U, i equal I, and s equal S.
        2. If u is equal to presentationUrl and i is equal to presentationId, run the following steps:
            1. Resolve P with S.
            2. Establish a presentation connection with S.
            3. Abort the remaining steps of T.
    2. Reject P with a "NoPresentationFound" exception.
 -->


1. Pを新しいPromiseとする。
2. Pを返す。
3. Dを、UAが知っているプレゼンテーションのセットとする。
4. 以下のステップを順序どおりに実行するタスクTをキューに入れる。
    1. D内の各(U, I, D)に対して:
        1. uをU、iをI、sをSとする。
        2. uがpresentationUrl、iがpresentationIdと等しいなら、以下のステップを実行する:
            1. PをSで解決する。
            2. Sでプレゼンテーションコネクションを確立する。
            3. Tの残りのステップを中断する。
    2. Pを"NoPresentationFound"例外とともにリジェクトする。


### 7.3 プレゼンテーションコネクションの確立

<!-- 
When the user agent is to establish a presentation connection using a presentation session S, it must run the following steps:
 -->

UAがプレゼンテーションセッションSを使ってプレゼンテーションコネクションを確立するとき、以下のステップを実行する:

<!-- 
1. If S.state is connected, then:
    1. Abort all remaining steps.
2. Queue a task T to connect S to the document that is presenting S.url.
3. If T completes successfully, run the following steps:
    1. Set S.state to connected.
    2. Let D be the set of presentations known by the user agent.
    3. Queue a task T to run the following steps in order:
        1. For each presentation (U, I, S') in D,
            1. Let u equal U, i equal I, and s equal S'.
            2. If u is equal to S.url and i is equal to S.id, run the following steps:
                1. Queue a task to fire an event named statechange at s.onstatechange.
 -->

1. もしS.stateがconnectedなら:
    1. 残りのステップを中断する。
2. SとS.urlを表示しているドキュメントを接続するタスクTをキューに入れる。
3. Tが成功で完了した場合、以下のステップを実行する:
    1. S.stateをconnectedにセットする。
    2. DをUAが知っているプレゼンテーションのセットとする。
    3. 以下のステップを順序どおりに実行するタスクTをキューに入れる。
        1. D内の各プレゼンテーション(U, I, S')に対して,
            1. uをU、iをI、sをS'とする。
            2. uがS.url、iがS.idと等しいとき、以下のステップを実行する:
                1. s.onstatechangeでstatechangeイベントを発火するタスクをキューに入れる。

### 7.4 onavailablechangeイベントハンドラ

<!-- 
The following are the event handlers (and their corresponding event handler event types) that must be supported, as event handler IDL attributes, by objects implementing the PresentationSession interface:
 -->

以下は、PresentationSessionインタフェースを実装しているオブジェクトで、イベントハンドラIDL属性としてサポートされなければならないイベントハンドラである:

Event handler | Event handler event type
------ | -------
onavailablechange | availablechange

<!-- 
In order to satisfy the power saving non-functionional requirements the user agent must keep track of the number of EventHandlers registered to the onavailable event. Using this information, implementation specific discovery of presentation displays can be resumed or suspended, in order to save power.
 -->

パワーセーブ非機能要件を満たすため、UAはonavailableイベントに登録されているイベントハンドラの数を把握しなければならない。
この情報を使って、プレゼンテーションディスプレイの実装固有の検出は、パワーセーブのため再開や一時停止をすることができる。

<!-- 
The user agent must keep a list of available presentation displays. According to the number of event handlers for onavailablechange, the user agent must also keep the list up to date by running the algorithm for monitoring the list of available presentation displays.
 -->

UAは<b>使用可能なプレゼンテーションディスプレイのリスト</b>を保持しなければならない。
onavailablechangeのイベントハンドラの数に従って、UAは使用可能なプレゼンテーションディスプレイのリストの監視のためのアルゴリズムの実行によって、リストを最新に保たなければならない。

### 7.5 onavailablechangeへのイベントハンドラの追加

<!-- 
When an event handler is added to the list of event handlers registered for the onavailablechange event, the user agent must run the algorithm to monitor the list of available presentation displays.
 -->

onavailablechangeイベントに登録されたイベントハンドラのリストに、イベントハンドラが追加されたとき、UAは使用可能なプレゼンテーションディスプレイのリストの監視のアルゴリズムを実行しなければならない。


### 7.6 イベントハンドラの削除

<!-- 
When an event handler is removed from the list of event handlers registered to the onavailablechange event, the user agent must run the following steps:
 -->

イベントハンドラがonavailablechangeイベントに登録されたイベントハンドラのリストから削除されたとき、
UAは以下のステップを実行しなければならない。

<!-- 
1. If the removed event handler was the last one in the list, cancel monitoring the list of available presentation displays.
 -->

1. 削除されたイベントハンドラがリストの最後の一つなら、使用可能なプレゼンテーションディスプレイのリストの監視を中止する。

### 7.7 使用可能プレゼンテーションディスプレイのリストの監視

<!-- 
When the user agent is to monitor the list of available presentation displays, it must run the following steps:
 -->

UAが<b>使用可能なプレゼンテーションディスプレイのリストの監視</b>をするとき、以下のステップを実行しなければならない:

<!-- 
While there are event handlers added to NavigatorPresentation.onavailablechange, the user agent must continuously keep track the list of available presentation displays and repeat the following steps:
 -->

NavigatorPresentation.onavailablechangeに追加されたイベントハンドラがあるとき、
UAは引き続き使用可能なプレゼンテーションディスプレイのリストの経過を追い、以下のステップを繰り返さなければならない。

<!-- 
1. Queue a task to retrieve the the list of curently available presentation displays and let newDisplays be this list.
2. Wait for the completion of that task.
3. If availableDisplays is empty and newDisplays is not empty, then
    1. Queue a task to fire an event named availablechange at with the event's available property set to true.
4. If availableDisplays is not empty and newDisplays is empty, then:
    1. Queue a task to fire an event named availablechange with the event's available property set to false.
5. Set the list of available presentation displays to the value of newDisplays.
 -->

1. 現在使用可能なプレゼンテーションディスプレイのリストを取得し、newDisplayをそのリストとするタスクをキューに入れる。
2. そのタスクの完了を待機する。
3. availableDisplayが空で、newDisplayが空でないなら、
    1. イベントのavailableプロパティをtrueにセットして、avalablechangeイベントを発火するタスクをキューに入れなければならない。
4. availableDisplaysが空でなく、newDisplayが空なら:
    1. イベントのavailableプロパティをfalseにセットして、avalablechangeイベントを発火するタスクをキューに入れなければならない。
5. 使用可能なプレゼンテーションディスプレイのリストを、newDisplaysの値で設定する。


<!-- 
When the user agent is to cancel monitoring the list of available presentation displays, it must run the following steps:
 -->

UAが<b>使用可能なプレゼンテーションディスプレイのリストの監視をキャンセル</b>するとき、以下のステップを実行しなければならない:


<!-- 
1. Cancel any tasks to retrieve the list of available presentation displays.
2. Set the list of available presentation displays to empty.
3. Queue a task to fire an event named availablechange at E (and only E) with the event's available property set to false.
 -->

1. 使用可能なプレゼンテーションディスプレイのリストの取得のタスクをキャンセルする。
2. 使用可能なプレゼンテーションディスプレイのリストを空にする。
3. availableプロパティをfalseにセットした、availablechangeという名のイベントをキューに入れる。


## 8 AvailableChangeEventインタフェース

```
[Constructor(DOMString type, optional AvailableChangeEventInit eventInitDict)]
interface AvailableChangeEvent : Event {
  readonly attribute boolean available;
};

dictionary AvailableChangeEventInit : EventInit {
  boolean available;
};

```

<!-- 
An event named availablechange is fired during the execution of the monitoring presentation display availability algorithm when the presentation display availability changes. It is fired at the PresentationSession object, using the AvailableChangeEvent interface, with the available attribute set to the boolean value that the algorithm determined.
 -->


availablechangeイベントは、プレゼンテーションディスプレイの可用性監視アルゴリズムの実行中、<b>プレゼンテーションディスプレイの可用性</b>が変化したときに発火する。
それはPresentationSessionオブジェクトで、AvailableChangeEventインタフェースを使用して、
available属性がアルゴリズムが決めたboolean値に設定されて発火する。


## セキュリティとプライバシーの検討

[ISSUE 45: Security and privacy considerations section](https://github.com/w3c/presentation-api/issues/45)

## リファレンス

略

## 謝辞

略