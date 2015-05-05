---
layout: page
title: Intoroduction
date: 2015-05-05
repository: 
---

# Indroduction

## UPnP技術とは？

<!-- 
UPnP technology defines an architecture for pervasive peer-to-peer network connectivity of intelligent appliances, wireless devices, and PCs of all form factors. It is designed to bring easy-to-use, flexible, standards-based connectivity to ad-hoc or unmanaged networks whether in the home, in a small business, public spaces, or attached to the Internet. UPnP technology provides a distributed, open networking architecture that leverages TCP/IP and Web technologies to enable seamless proximity networking in addition to control and data transfer among networked devices.
 -->

UPnP技術は、あらゆる形状のインテリジェントな電気機器、無線デバイス、PCなどの広く普及したP2Pネットワーク接続のためのアーキテクチャを定義する。
これは家庭や中小企業、公共スペース、インターネットに接続されているかにかかわらない、
これはアドホックもしくは管理されていないネットワークに、使いやすく、フレキシブルで、標準に基づいた接続を与えるようデザインされている。
それは家や中小企業内であったり、公共スペースにであったり、インターネットに接続されているかに関わらない。
UPnP技術はTCP/IPとWeb技術を利用した、分散したオープンネットワークアーキテクチャを提供する。
それはットワーク機器間の制御とデータ転送に加えて、シームレスな近接ネットワークを可能にする。

<!-- 
The UPnP Device Architecture (UDA) is more than just a simple extension of the plug and play peripheral model. It is designed to support zero-configuration, "invisible" networking, and automatic discovery for a breadth of device categories from a wide range of vendors. This means a device can dynamically join a network, obtain an IP address, convey its capabilities, and learn about the presence and capabilities of other devices. Finally, a device can leave a network smoothly and automatically without leaving any unwanted state behind.
 -->

UPnPデバイスアーキテクチャ(UDA)は、周辺機器のプラグ&プレイモデルの単純な拡張以上のものである。
それはゼロコンフィグレーション、"不可視(invisible)"のネットワーク、そして幅広いベンダの広いデバイスカテゴリの自動検出をサポートするよう設計されている。
これは、デバイスは動的にネットワークに参加し、IPアドレスを取得し、その機能を伝え、他のデバイスの存在と機能を知ることができることを意味する。
最終的に、デバイスは不必要な状態を残さずに、ネットワークをスムーズに自動的に去ることができる。

<!-- 
The technologies leveraged in the UPnP architecture include Internet protocols such as IP, TCP, UDP, HTTP, and XML. Like the Internet, contracts are based on wire protocols that are declarative, expressed in XML, and communicated via HTTP. Using Internet protocols is a strong choice for UDA because of its proven ability to span different physical media, to enable real world multiple-vendor interoperation, and to achieve synergy with the Internet and many home and office intranets. The UPnP architecture has been explicitly designed to accommodate these environments. Further, via bridging, UDA accommodates media running non-IP protocols when cost, technology, or legacy prevents the media or devices attached to it from running IP.
 -->

UPnPアーキテクチャで利用されている技術には、IP、TCP、UDP、HTTPやXMLなどのインターネットプロトコルが含まれる。
インターネットのように、規約は有線プロトコルに基づいている。それは宣言的に、XMLで表現され、HTTPを使って通信する。
インターネットプロトコルを使うことは、UDAの強い選択である。
なぜならそれには、異なる物理メディアに広がり、実世界での複数ベンダによる相互運用を可能にし、インターネットや多数のホーム、オフィスイントラネットとの相乗効果をもたらす、証明された能力があるからである。
UPnPアーキテクチャは、それらの環境に適用するよう明確に設計されている。
さらに、コスト・技術・レガシーが、それに接続されたメディアやデバイスが、IPを動かせないようにしているとき、UDAはブリッジを通して非IPプロトコルを動かしているメディアに適用する。

<!-- 
What is "universal" about UPnP technology? No device drivers; common protocols are used instead. UPnP networking is media independent. UPnP devices can be implemented using any programming language, and on any operating system. The UPnP architecture does not specify or constrain the design of an API for applications; OS vendors may create APIs that suit their customers’ needs.
 -->

UPnP技術の"universal"とはなんだろうか。
No device drivers;
ありふれたプロトコルが代わりに使われる。
UPnPネットワーキングはメディアと独立している。
UPnPデバイスはいくつものプログラミング言語、いくつものOS上で実装できる。
UPnP技術はアプリケーション用のAPIの設計を仕様に含めたり、強要したりしない;
OSベンダーはカスタマーのニーズに合わせてAPIを作ることができる。



## UPnPフォーラム

<!-- 
UPnP Forum is an industry initiative designed to enable easy and robust connectivity among stand-alone devices and PCs from many different vendors. UPnP Forum seeks to develop standards for describing device protocols and XML-based device schemas for the purpose of enabling device-to-device interoperability in a scalable, networked environment.
 -->

UPnPフォーラムは、多くの異なるベンダー製のスタンドアロンデバイスやPC間の、簡単で強固な接続を可能にするよう設計されたindustry initiativeである。
UPnPフォーラムは、デバイスプロトコルを表現するための標準と、XMLベースのデバイススキーマを開発しようとしている。
それはdevice-to-deviceの相互運用をスケーラブルに、ネットワークで繋がった環境で可能にするためである。

<!-- 
UPnP Forum is comprised of member companies across many industries that promote the adoption of uniform technical device interconnectivity standards and testing and certifying of these devices. The Forum develops and administers the testing and certification process, administers the UPnP logo program, and provides information to members and other interested parties regarding the certification of UPnP devices. The UPnP device certification process is open to any vendor who is an implementer level member of UPnP Forum, has paid the implementer dues, and has devices that support UPnP functionality. For more information, see http://www.upnp.org.
 -->

UPnPフォーラムは、多くの産業を横断したメンバ企業からなっている。
それら企業は、技術的なデバイス間接続の統一規格の採用を促進し、それらのデバイスのテスト及び認証を行う。
本フォーラムは、テストと認証プロセスを開発・運用し、UPnPロゴプログラムを運営し、メンバや他のUPnPデバイスの認証について関心があるパーティに対して情報を提供する。
UPnPデバイス認証作業は、UPnPフォーラムのメーカーレベルのメンバーであり、メーカー手数料を支払っていて、UPnPの機能性をサポートするデバイスを持っている、いかなるベンダにもオープンにされている。
詳しい情報は、http://www.upnp.orgを参照。

<!-- 
UPnP Forum has set up working committees in specific areas of domain expertise. These working committees are charged with creating proposed device standards, building sample implementations, and building appropriate test suites. This document indicates specific technical decisions that are the purview of UPnP Forum working committees.
 -->

UPnPフォーラムは、特定の専門分野の実行委員会を設立している。
それらの実行委員会は、デバイス標準案の作成、サンプル実装の製作、適切なテストスイートの構築を任されている。
本ドキュメントは、UPnPフォーラム実行委員会の範囲の、明確な技術的決定を示している。

<!-- 
UPnP vendors can build compliant devices with confidence of interoperability and benefits of shared intellectual property and the logo program. Separate from the logo program, vendors
may also build devices that adhere to the UPnP Device Architecture defined herein without a formal standards procedure. If vendors build non-standard devices, they determine technical decisions that would otherwise be determined by a UPnP Forum working committee.
 -->

UPnPベンダは、相互運用性の信頼と、共通の知的財産とロゴプログラムの利益に準拠したデバイスを作ることができる。
ロゴプログラムを別にして、ベンダはフォーマルな標準手順無しで、ここで定義されているUPnPデバイスアーキテクチャに従ったデバイスを作ることができる。
もしベンダが非標準のデバイスを製作したなら、さもなければUPnPフォーラム実行委員会によって決定された技術決定を、彼らは確定するだろう。

## 本書について

<!-- 
The UPnP Device Architecture (formerly known as the DCP Framework) contained herein defines the protocols for communication between controllers, or control points, and devices. For discovery, description, control, eventing, and presentation, the UPnP Device Architecture uses the following protocol stack (the indicated colors and type styles are used throughout this document to indicate where each protocol element is defined):
 -->

ここで書かれているUPnPデバイスアーキテクチャ（かつてはDCPフレームワークで知られた）は、コントローラやコントロールポイント、デバイス間の通信のためのプロトコルを定義する。
discovery、description、control、eventingやpresentationのため、UPnPデバイスアーキテクチャは下記のプロトコルスタックを使用する（表示された色やスタイルは本ドキュメント中でそれぞれのプロトコル要素が定義されている場所を示している）。


<table>
<tr><td colspan="4">UPnP vendor</td></tr>
<tr><td colspan="4">UPnP Forum</td></tr>
<tr><td colspan="4">UPnP Device Architecture</td></tr>
<tr><td rowspan="2">SSDP</td><td rowspan="2">Multicast events</td><td>SOAP</td><td>GENA</td></tr>
<tr><td>HTTP</td><td>HTTP</td></tr>
<tr><td colspan="2">UDP</td><td colspan="2">TCP</td></tr>
<tr><td colspan="4">IP</td></tr>
</table>

<!-- 
At the highest layer, messages logically contain only UPnP vendor-specific information about
their devices. Moving down the stack, vendor content is supplemented by information defined
by UPnP Forum working committees. Messages from the layers above are hosted in UPnPspecific
protocols such as the Simple Service Discovery Protocol (SSDP), the General Event
Notification Architecture (GENA) and the multicast event protocol defined in this document,
and others that are referenced. SSDP is delivered via either multicast or unicast UDP.
Multicast events are delivered via multicast UDP. GENA is delivered via HTTP. Ultimately, all
messages above are delivered over IP. The remaining clauses of this document describe the
content and format for each of these protocol layers in detail. For reference, colors in [square
brackets] above indicate which protocol defines specific message components throughout this
document.
 -->

最上位レイヤでは、メッセージはデバイスについてUPnPベンダ固有の情報だけを論理的に含んでいる。
スタックの下のレイヤでは、ベンダコンテンツはUPnP Forum実行委員会によって定義される情報によって補完される。
上位レイヤからのメッセージは、UPnP固有のプロトコルでホストされる。例えばSimple Service Discovery Protocol (SSDP)、General Event
Notification Architecture (GENA)や本ドキュメントで定義されるマルチキャストイベントプロトコルや、参照される他のプロトコルなどである。
SSDPはマルチキャストかユニキャストUDPどちらかで送られる。
マルチキャストイベントはマルチキャストUDPによって送られる。
GENAはHTTPで送られる。
最終的に、全ての上記メッセージはIPで送られる。
本ドキュメントの節は、これらのプロトコルレイヤそれぞれのコンテンツとフォーマットについて詳細に説明している。
参照のため、[角括弧]はどのプロトコルが本ドキュメント内の特定のメッセージコンポーネントを定義しているかを示している。

<!-- 
Two general classifications of devices are defined by the UPnP architecture: controlled
devices (or simply “devices”), and control points. A controlled device functions in the role of a
server, responding to requests from control points. Both control points and controlled devices
can be implemented on a variety of platforms including personal computers and embedded
systems. Multiple devices, control points, or both may be operational on the same network
endpoint simultaneously.
 -->

UPnPアーキテクチャでは、デバイスの2つの大まかな分類が定義されている:
コントロールされるデバイス(単純に"デバイス")と、コントロールポイントである。
サーバの役割である、コントロールされるデバイスの機能は、コントロールポイントからのリクエストに応答することである。
コントロールポイントとコントロールされるデバイスは両方とも、PCや埋め込みシステムを含む、多様なプラットフォームで実装できる。
複数のデバイス、コントロールポイント、もしくは両方は、同時に同一ネットワークエンドポイント上で運用できる。

<!--
Note: This document is oriented toward an IPv4 environment. Considerations for an IPv6 environment are expressed in Annex A.
-->

本ドキュメントはIPv4環境に重点を置いている。
IPv6環境のための留意事項は、付録Aに記載されている。

<!-- 
The foundation for UPnP networking is IP addressing. In an IPv4 environment, each device or control point shall have a Dynamic Host Configuration Protocol (DHCP) client and search for a DHCP server when the device or control point is first connected to the network. If a DHCP server is available, i.e., the network is managed; the device or control point shall use the IP address assigned to it. If no DHCP server is available, i.e., the network is unmanaged; the device or control point shall use Auto IP to get an address. In brief, Auto IP defines how a device or control point intelligently chooses an IP address from a set of reserved addresses and is able to move easily between managed and unmanaged networks. If during the DHCP transaction, the device or control point obtains a domain name, e.g., through a DNS server or via DNS forwarding, the device or control point should use that name in subsequent network operations; otherwise, the device or control point should use its IP address.
 -->

UPnPネットワーキングの基礎はIPアドレッシングである。
IPv4環境下では、各デバイスやコントロールポイントはDynamic Host Configuration Protocol (DHCP)クライアントを持ち、デバイスやコントロールポイントが最初にネットワークに接続されたときにDHCPサーバを探すものとする。
例:ネットワークが管理されているとき;デバイスやコントロールポイントは割り当てられたIPアドレスを使用するものとする。
例:ネットワークが管理されていないとき;デバイスやコントロールポイントは、アドレスを取得するためAuto IPを使用するものとする。
つまり、Auto IPはどのようにデバイスやコントロールポイントが、予約されたアドレスセットからインテリジェントにIPアドレスを選択するかを定義している。また、管理・非管理のネットワーク間で簡単に移動することができる。
もしDHCPトランザクション中、デバイスやコントロールポイントがドメインネームを取得したなら、例えばDNSサーバを使ったり、DNSフォワーディングを通して、デバイスやコントロールポイントは、その後のネットワーク運用でその名前を使用するべきである; さもなければ、デバイスやコントロールポイントは、そのIPアドレスを使用するべきである。

<!-- 
Certain UPnP networks have more complex configurations such as multiple physical networks and/or multiple logical networks to accommodate multiple non-overlapping addressing schemes. Devices and control points may also have two or more network interfaces, and/or two or more IP addresses assigned to each interface. In such configurations, a single device or control point may be assigned multiple IP addresses from different logical networks in the same UPnP network, resulting in devices appearing to a control point multiple times in the network. Devices and control points that have multiple IP addresses on the same UPnP network are referred to as multi-homed. Throughout this document, the term "UPnP-enabled interface" is used to refer to an interface which is assigned an IP address belonging to the UPnP network. Additional behaviors specific to multi-homed devices and control points will be covered in applicable clauses throughout the document. However, as a general principle, related interactions between control points and devices (e.g. action control request and response messages, event subscription and event messages) shall occur using the same pair of outgoing and incoming UPnP-enabled interfaces.
 -->

あるUPnPネットワークは、さらに複雑な構成かもしれない。例えば、複数の重複しないアドレススキームに対応した複数物理ネットワークと/または複数論理ネットワークなどである。
デバイスやコントロールポイントは、2つ以上のネットワークインタフェースを持つかもしれない。さらに/または各インタフェースに2つ以上のIPアドレスが割り当てられているかもしれない。
このような構成では、一つのデバイスやコントロールポイントに対して、同一UPnPネットワーク内の異なる論理ネットワークから、複数のIPアドレスを割り当てられるかもしれず、
ネットワーク内で複数回コントロールポイントに現れるデバイスを生み出すかもしれない。
同一UPnPネットワーク上で、複数IPアドレスを持つデバイスとコントロールポイントは、マルチホームと呼ばれる。
本ドキュメント内では、"UPnP可能インタフェース"という用語は、UPnPネットワークに属しているIPアドレスを割り当てられたインタフェースを指す。
マルチホームデバイスとコントロールポイント特有の振る舞いは、本ドキュメント中の適用節で触れられている。
しかし、大まかな方針として、コントロールポイントとデバイス間の関連したやりとり(例えばアクションコントロールリクエストとレスポンスメッセージ、イベント購読とイベントメッセージ等)は、UPnP可能インタフェースの送受信の同一ペアで発生するものとする。

<!-- 
Given an IP address, Step 1 in UPnP networking is discovery. When a device is added to the network, the UPnP discovery protocol allows that device to advertise its services to control points on the network. Similarly, when a control point is added to the network, the UPnP discovery protocol allows that control point to search for devices of interest on the network. The fundamental exchange in both cases is a discovery message containing a few essential specifics about the device or one of its services, e.g., its type, identifier, and a pointer to more detailed information. The clause on Discovery below explains how devices advertise, how control points search, and contains details about the format of discovery messages.
 -->

IPアドレスを与えられた後、UPnPネットワーキングのステップ1は、ディスカバリである。
デバイスがネットワークに追加された時、UPnPディスカバリプロトコルは、デバイスがそのサービスをネットワーク上のコントロールポイントに広告することを許可する。
同様に、コントロールポイントがネットワークにうち化された時、UPnPディスカバリプロトコルは、コントロールポイントがネットワーク上の興味のあるデバイスをサーチすることを許可する。
両方のケースで基本的にやりとりされるメッセージは、デバイスやサービスの一つを指定するいくつかの必須項目を含むディスカバリメッセージである。
例えば型、ID、より詳細な情報へのポインタなどである。
ディスカバリの節では、どのようにデバイスがアドバタイズし、どのようにコントロールポイントがサーチするか、さらにディスカバリメッセージのフォーマットの詳細が含まれている。

<!-- 
Step 2 in UPnP networking is description. After a control point has discovered a device, the control point still knows very little about the device. For the control point to learn more about the device and its capabilities, or to interact with the device, the control point shall retrieve the device's description from the URL provided by the device in the discovery message. Devices may contain other logical devices, as well as functional units, or services. The UPnP description for a device is expressed in XML and includes vendor-specific manufacturer information like the model name and number, the serial number, the manufacturer name, URLs to vendor-specific Web sites, etc. The description also includes a list of any embedded devices or services, as well as URLs for control, eventing, and presentation. For each service, the description includes a list of the commands, or actions, to which the service responds, and parameters, or arguments for each action; the description for a service also includes a list of variables; these variables model the state of the service at run time, and are described in terms of their data type, range, and event characteristics. The clause on Description below explains how devices are described and how control points retrieve those descriptions.
 -->

UPnPネットワーキングのステップ2は、ディスクリプションである。
コントロールポイントがデバイスを発見した後、コントロールポイントはデバイスについてとても少ない情報しか知らない。
コントロールポイントがより詳しくデバイスやその機能について知るため、またはデバイスとやりとりするため、コントロールポイントはディスカバリメッセージ内のURLから、デバイスのディスクリプションを取得するものとする。
デバイスは機能ユニットだけではなく他の論理デバイスやサービスを含むことができる。
デバイスのUPnPディスクリプションは、XMLで表され、ベンダ固有の製造情報を含む。モデル名やモデル番号、シリアル番号、製造名、ベンダー固有のWebサイトへのURLなどである。
ディスクリプションはさらに埋め込みデバイスやサービス、イベントやプレゼンテーション、コントロール用のURLのリストを含む。
各サービス用に、ディスクリプションは、サービスが応答するコマンドやアクション、各アクション用のパラメータや引数のリストを含む;
サービス用のディスクリプションはさらに、変数のリストを含む;
それらの変数は、実行時のサービスの状態を表し、それらはデータ型、範囲、イベント特性に関して記載されている。
ディスクリプションの節では、どのようにデバイスが記載され、どのようにコントロールポイントがそれらディスクリプションを取得するかについて説明されている。

<!-- 
Step 3 in UPnP networking is control. After a control point has retrieved a description of the device, the control point can send actions to a device's services. To do this, a control point sends a suitable control message to the control URL for the service (provided in the device description). Control messages are also expressed in XML using the Simple Object Access Protocol (SOAP). Like function calls, in response to the control message, the service returns any action-specific values. The effects of the action, if any, are modeled by changes in the variables that describe the run-time state of the service. The clause on Control below explains the description of actions, state variables, and the format of control messages.
 -->

UPnPネットワーキングのステップ3はコントロールである。
コントロールポイントがデバイスのディスクリプションを取得した後、コントロールポイントはデバイスのサービスにアクションを送信することができる。
このためには、コントロールポイントはサービスに適切なコントロールメッセージをコントロールURL(デバイスディスクリプションに含まれる)に送信する。
コントロールメッセージはXMLで表現され、Simple Object Access Protocol (SOAP)を使用している。
関数呼び出しのように、コントロールメッセージへの応答では、サービスはアクション固有の値を返す。
アクションの効果がもしあれば、サービスの実行時の状態を表す変数の変化により表される。


Step 4 in UPnP networking is eventing. A UPnP description for a service includes a list of actions the service responds to and a list of variables that model the state of the service at run time. The service publishes updates when these variables change, and a control point may subscribe to receive this information. The service publishes updates by sending event messages. Event messages contain the names of one or more state variables and the current value of those variables. These messages are also expressed in XML. A special initial event message is sent when a control point first subscribes; this event message contains the names and values for all evented variables and allows the subscriber to initialize its model of the state of the service. To support scenarios with multiple control points, eventing is designed to keep all control points equally informed about the effects of any action. Therefore, all subscribers are sent all event messages, subscribers receive event messages for all evented
variables that have changed, and event messages are sent no matter why the state variable changed (either in response to a requested action or because the state the service is modeling changed). Multicast eventing is a variant of Step 4 in UPnP networking. Through multicast eventing, control points can listen to state changes in services without subscription. This form of eventing is useful first when events which are not relevant to specific UPnP interactions should be delivered to control points to inform users, and second when multiple controlled devices want to inform multiple other control points. Multicast eventing is inherently unreliable since it is based on UDP. To increase the probability of successful transmission, the option to retransmit multicast event notifications is outlined. UPnP Working committees should define whether specific events are multicast events. The clause on Eventing below explains unicast event subscription and the format of both unicast and multicast event messages.

UPnPネットワーキングのステップ4はイベンティングである。
サービスのUPnPディスクリプションは、サービスが応答するアクションのリストと、実行時にサービスの状態を表す変数のリストを含む。
サービスは変数が変化した時に更新を発行するので、コントロールポイントはその情報を取得するためにそれを購読できる。
サービスはイベントメッセージの送信によって更新を発行する。
イベントメッセージはひとつ以上の状態変数の名前と、それらの変数の現在の値を含む。
それらのメッセージはXMLで表される。
コントロールポイントが最初に購読した時、特別な開始イベントメッセージが送信される;
このイベントメッセージは、すべてのイベント変数の名前と値を含み、購読者がサービスの状態のモデルを初期化することを許可する。
複数のコントロールポイントのシナリオをサポートするため、イベンティングはすべてのコントロールポイントは平等にアクションの効果について


UPnP実行委員会は、明示的にイベントがマルチキャストイベントかどうか定義するべきである。
イベンティングの節では、ユニキャストイベント購読と、ユニキャストとマルチキャストイベントメッセージ両方のフォーマットについて解説している。


Step 5 in UPnP networking is presentation. If a device has a URL for presentation, then the control point can retrieve a page from this URL, load the page into a browser, and depending on the capabilities of the page, allow a user to control the device and/or view device status. The degree to which each of these can be accomplished depends on the specific capabilities of the presentation page and device. The clause on Presentation below explains the protocol for retrieving a presentation page.

UPnPネットワーキングのステップ5はプレゼンテーションである。
デバイスがプレゼンテーション用のURLを持っているなら、コントロールポイントはこのURLからページを取得し、ブラウザにロードし、ページの機能によるが、ユーザはデバイスの制御と/またはデバイスの状態の閲覧が可能である。
それらの程度はプレゼンテーションページとデバイスの明示的な機能によって達成される。
プレゼンテーションの節では、プレゼンテーションページの取得のためのプロトコルについて説明されている。


## Audience

The audience for this document includes UPnP device and control point vendors, members of UPnP Forum working committees, and anyone else who has a need to understanding the technical details of UPnP protocols.


This document assumes the reader is familiar with the HTTP, TCP, UDP, IP family of protocols; this document makes no attempt to explain them. This document also assumes most readers will be new to XML, and while it is not an XML tutorial, XML-related issues are addressed in detail given the centrality of XML to the UPnP Device Architecture. This document makes no assumptions about the reader's understanding of various programming or scripting languages.


## Conformance terminology

In this document, features are described as required, recommended, allowed or DEPRECATED as follows:

### Required (or shall or mandatory).

These basic features shall be implemented to comply with UPnP Device Architecture. The phrases “shall not”, and “PROHIBITED” indicate behavior that is prohibited, i.e. that if performed means the implementation is not in compliance.

### Recommended (or should).

These features add functionality supported by UPnP Device Architecture and should be implemented. Recommended features take advantage of the capabilities UPnP Device Architecture, usually without imposing major cost increases. Notice that for compliance testing, if a recommended feature is implemented, it shall meet the specified requirements to be in compliance with these guidelines. Some recommended features could become requirements in the future. The phrase “should not” indicates behavior that is permitted but not recommended.

### Allowed (Allowed ).

These features are neither required nor recommended by UPnP Device Architecture, but if the feature is implemented, it shall meet the specified requirements to be in compliance with these guidelines. These features are not likely to become requirements in the future.

### DEPRECATED.

Although these features are still described in this specification, they should not be implemented except for backward compatibility. The occurrence of a deprecated feature during operation of an implementation compliant with the current specification has no effect on the implementation’s operation and does not produce any error conditions. Backward compatibility may require that a feature is implemented and functions as specified but it shall never be used by implementations compliant with this specification.



## Acronyms

## Glossary

### action

サービスにより提供されているコマンド。
一つ以上の入出力引数を取る。
戻り値を持つこともある。
詳しくは節2「ディスクリプション」 と節3「コントロール」を参照。

### argument

サービスにより提供されているアクションのためのパラメータ。
inかout。
詳しくは節2「ディスクリプション」と節3「コントロール」を参照。


### control point

デバイスおよびサービスディスクリプションを取り出し、サービスにアクションを送信し、サービスの状態変数をポーリングし、サービスからイベントを受信する。

### device

論理的なデバイス。
コンテナ。
他のデバイスを埋め込んでいることもある。
一つ以上のサービスを埋め込んでいる。
自身のプレゼンスをネットワーク上に広告する。
詳しくは節1「ディスカバリ」と、節2「ディスクリプション」を参照。

### device description

論理デバイスのフォーマルな定義、UPnPテンプレート弦をにより表現される。
XML構文で書かれる。
UPnPデバイステンプレート内のプレースホルダを埋めることでUPnPベンダによって書かれる。
例えばメーカ名、モデル名、モデルナンバー、シリアルナンバーやコントロール、イベント、プレゼンテーションのためのURLなどを含む。
詳しくは節2「ディスプリプション」を参照。


### device type

標準的なデバイスタイプは、urn:schemas-upnp-org:device:で表される。この後にはUPnPForum実行委員会によって割り当てられるユニークな名前が続く。
UPnPデバイステンプレートと一対一の関係。
UPnPベンダは追加のデバイスタイプを規定できる; これらはurn:domain-name:device:で表される。この後にはベンダによって割り当てられるユニークな名前が続く。
domain-nameはベンダードメイン名である。
詳しくは節2「ディスプリプション」を参照。


### event

サービスによって提供される状態変数の一つ以上の変化の通知。
詳しくは節4「イベント」を参照。


### GENA

General Event Notification Architecture。
節4「イベント」で定義される、イベント購読と通知のプロトコル。


### publisher

イベントメッセージ元。
通常はデバイスのサービス。
詳しくは節4「イベント」を参照。

### root device

他の論理デバイスの中に埋め込まれていない論理デバイス。
詳しくは節2「ディスクリプション」を参照。
### service

### service description

論理的な機能単位。
コントロールの最も小さい単位。
アクションを提供し、状態変数で物理デバイスの状態を表す。
詳しくは節3「コントロール」を参照。

### service type
標準的なサービスタイプは、urn:schemas-upnp-org:service:で表される。この後にはUPnPForum実行委員会によって割り当てられるユニークな名前、コロン、バージョンナンバーが続く。
UPnPサービステンプレートと一対一の関係。
UPnPベンダは追加のサービスタイプを規定できる; これらはurn:domain-name:service:で表される。この後にはベンダによって割り当てられるユニークな名前が続く。
domain-nameはベンダードメイン名である。
詳しくは節2「ディスプリプション」を参照。


### SOAP

Simple Object Access Protocol。
XMLに基づいたリモートプロシージャコールのメカニズム。HTTP上でコマンドを送り、値を受け取る。
詳しくは節3「コントロール」を参照。

### SSDP

Simple Service Discovery Protocol。
マルチキャストディスカバリ、サーチメカニズム。
マルチキャスト版のHTTP over UDPを使用する。
詳しくは節3「コントロール」を参照。

### state variable

物理サービスを表現する一面。
サービスにより提供される。
名前、データ型、任意のデフォルト値、任意の制約値を持ち、値が変わった際はイベントを引き起こすことができる。
詳しくは節2「ディスクリプション」と節3「コントロール」を参照。

### subscriber

イベントメッセージの受信者。
通常はコントロールポイント。
詳しくは節4「イベント」を参照。

### UPnP Device Template

デバイスタイプをリストしたテンプレート。(もしあれば)埋め込まれたデバイスが要求され、サービスが必須となる。
XML構文で書かれ、UPnPデバイススキーマから派生している。
UPnPフォーラム実行委員会により定義される。
標準的なデバイスタイプと一対一の関係。
詳しくは節2「ディスクリプション」を参照。

### UPnP Service Template

アクション名、それらアクションのパラメータ、状態変数、そしてそれらの状態変数のプロパティをリストしたテンプレート。
XML構文で書かれ、UPnPサービススキーマから派生している。
UPnPフォーラム実行委員会により定義される。
標準的なサービスsタイプと一対一の関係。
詳しくは節2「ディスクリプション」を参照。


### UPnP Device Schema

UPnPデバイスとサービステンプレートで使用される要素と属性を定義する。
XML構文で書かれ、XMLスキーマ(Part1: 構造、Part2: データタイプ)から派生している。
このUPnPデバイスアーキテクチャで定義されている。
詳しくは節2「ディスクリプション」を参照。

### Vendor Domain Name

ベンダから提供されるドメイン名。
ベンダにより所有され、ICANNが認定したレジストラにより登録されたもので、ユニークであるものとする。
ベンダはドメイン名登録を最新にし続けるものとする。
ベンダドメイン名長は、UDA内のドメイン名の使用と互換性があるように選択されるべきである。

## References and resources 

RFC 2710, Multicast Listener Discovery for IPv6. 
http://www.ietf.org/rfc/rfc2710.txt.

RFC 2616, HTTP: Hypertext Transfer Protocol 1.1. 
http://www.ietf.org/rfc/rfc2616.txt.

RFC 2279, UTF-8, a transformation format of ISO 10646 (character encoding). 
http://www.ietf.org/rfc/rfc2279.txt.

XML, Extensible Markup Language. W3C recommendation. 
http://www.w3.org/XML/.

DEVICEPROTECTION, UPnP Device Protection specification. 
http://upnp.org/specs/gw/UPnP-gw-DeviceProtection-v1-Service.pdf.

本ドキュメントの各節は、特定のトピックのリソースについて追加の情報を含む。
