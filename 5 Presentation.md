

## 5 プレゼンテーション

Presentation is Step 5 in UPnP networking. Presentation comes after addressing (Step 0)
where devices get network addresses, after discovery (Step 1) where control points find
interesting device(s), and after description (Step 2) where control points learn about device
capabilities. Presentation exposes an HTML-based user interface for controlling and/or
viewing device status. Presentation is complementary to control (Step 3) where control points
send actions to devices, and eventing (Step 4) where control points listen to state changes in
device(s).

プレゼンテーションはUPnPネットワーキングのステップ5である。
プレゼンテーションは、デバイスがネットワークアドレスを取得するアドレッシング(ステップ0)、コントロールポイントが興味のあるデバイスを検出するディスカバリ(ステップ1)、
コントロールポイントがデバイスの機能について知るディスクリプション(ステップ2)
の後に来る。
プレゼンテーションはHTMLベースのユーザインタフェースを、コントロールと/またはデバイスステータスを見るために提供する。
プレゼンテーションはコントロールポイントがデバイスにアクションを送信するコントロール(ステップ3)と、コントロールポイントがデバイスの状態変化をリッスンするイベンティング(ステップ4)の補完である。


After a control point has (1) discovered a device and (2) retrieved a description of the device,
the control point is ready to begin presentation. If a device has a URL for presentation, then
the control point can retrieve a page from this URL, load the page into a browser and,
depending on the capabilities of the page, allow a user to control the device and/or view
device status. The degree to which each of these can be accomplished depends on the
specific capabilities of the presentation page and device.

コントロールポイントがデバイスを検出し、デバイスのディスクリプションを取得した後、コントロールポイントはすぐにプレゼンテーションを開始できる。
デバイスがプレゼンテーションのためのURLを持っているなら、コントロールポイントはそのURLからページを取得することができ、ブラウザにページを読み込み、ページの機能次第で、ユーザにデバイスのコントロールと/またはデバイス状態の閲覧を可能にする。
それらが達成できるかは、プレゼンテーションページとデバイスの機能次第である。

The URL for presentation is obtained from the presentationURL element in the device
description. If presentationURL is an absolute URL, the fully qualified presentation URL is the
presentationURL. Otherwise, if presentationURL is a relative URL, the fully qualified
presentation URL is the URL resolved from presentationURL in accordance with clause 5 of
RFC 3986, using either the URLBase element, if specified, or the URL from which the device
description was retrieved as the base URL. A multi-homed control point that attempts to
retrieve a presentation page on a particular UPnP-enabled interface shall use the fully
qualified presentation URL from the description document received on that interface. The
device description is delivered via a description message. Clause 2, “Description” explains the
device description and description messages in detail.

プレゼンテーションのURLは、デバイスディスクリプションのpresentaionURL要素から取得する。
もしpresentaitonURLが絶対URLなら、省略されていないプレゼンテーションURLはpresentationURLである。
もしpresentationURLが相対URLなら、省略されていないプレゼンテーションURLは、RFC 3986の節5に従って、presentationURLから解決されるURLである。それは、もし指定されているならURLBase要素か、デバイスディスクリプションが取得されたURLをURLベースとして使用する。
あるUPnP可能インタフェースからプレゼンテーションページを取得しようと試みるマルチホームのコントロールポイントは、そのインタフェースから受信されたディスクリプションドキュメントから省略されていないプレゼンテーションURLを使用するものとする。
デバイスディスクリプションはディスクリプションメッセージを通して送られる。
節2「ディスクリプション」で、デバイスディスクリプションとディスクリプションメッセージについて詳細に説明している。


Retrieving a presentation page is a simple HTTP-based process and uses the following
subset of the overall UPnP protocol stack. (The overall UPnP protocol stack is listed at the
beginning of this document.)

プレゼンテーションページの取得はシンプルはHTTPベースのプロセスであり、全UPnPプロトコルスタックのうち、以下に示すサブセットを使用する。
(全UPnPプロトコルスタックは、本ドキュメントの最初に記述してある。)




<table>
<tr><td>UPnP vendor</td></tr>
<tr><td>UPnP Device Architecture</td></tr>
<tr><td>HTTP</td></tr>
<tr><td>TCP</td></tr>
<tr><td >IP</td></tr>
</table>

At the highest layer, the presentation page is specified by a UPnP vendor. Moving down the
stack, the UPnP Device Architecture specifies that this page be written in HTML. The page is
delivered via HTTP over TCP over IP. For reference, colors in [square brackets] are included
for consistency with other clauses in this document.

最上位レイヤでは、プレゼンテーションページはUPnPベンダによって記述される。
スタックを下ってくると、UPnPデバイスアーキテクチャはこのページをHTMLで記述する。
このページはHTTP over TCP over IPで送られる。
参考のため、[角括弧]内の色は本ドキュメントの他の節と一致させている。

To retrieve a presentation page, the control point issues an HTTP GET request to the
presentation URL, and the device returns a presentation page. Responses to HTTP GET
requests for presentation pages shall be sent using the same address on the same interface
on which the HTTP GET was received. The generic requirements on HTTP usage in UPnP 2.0
(as defined in clause 2.1, “Generic requirements on HTTP usage” of this document) shall be
followed by devices and control points that implement presentation.

プレゼンテーションページの取得のため、コントロールポイントはプレゼンテーションURLにHTTP GETリクエストを発行し、デバイスはプレゼンテーションページを返す。
プレゼンテーションページのためのHTTP GETリクエストへのレスポンスは、HTTP GETが受信されたのと同じインタフェース上で同じアドレスを使用して送信されるものとする。
UPnP 2.0内でのHTTPの利用の全体的な要件は、プレゼンテーションを実装するデバイスとコントロールポイントが後に続くものとする。

Unlike the UPnP Device and Service Templates, and standard device and service types, the
capabilities of the presentation page are completely specified by the UPnP vendor. The page
shall be an HTML page; it is recommended that the page be based upon XHTML-Basic.
However, other design aspects are left to the vendor to specify. This includes, but is not
limited to, all capabilities of the control point's browser, scripting language or browser plug-ins
used, and means of interacting with the device. To implement a presentation page, a UPnP
vendor MAY wish to use UPnP mechanisms for control and/or eventing, leveraging the
device's existing capabilities but is not constrained to do so.

UPnPデバイスおよびサービステンプレート、標準デバイスおよびサービスタイプと異なり、プレゼンテーションページの機能は完全にUPnPベンダによって規定される。
ページはHTMLページであるものとする;
ページはXHTML-Basicに基づいたページであることが推奨される。
しかし、他の設計面の規定はベンダに委ねられている。
これはコントロールポイントのブラウザの機能、使用されるスクリプト言語やブラウザプラグイン、およびデバイスとのやりとりの方法のすべてを含み、制限されない。
プレゼンテーションページを実装するため、UPnPベンダはコントロールと/またはイベンティング、デバイスの既存の機能の利用のためにUPnPメカニズムを使用することを望むかもしれない。
しかしそうすることを強制はされない。

Presentation pages should use mechanisms provided by HTML for localization (e.g., META
tag with charset attribute). Control points should use the ACCEPT-LANGUAGE and
CONTENT-LANGUAGE feature of HTTP to try to retrieve a localized presentation page.
Specifically, a control point MAY include a HTTP ACCEPT-LANGUAGE header field in the
request for a presentation page; if an ACCEPT-LANGUAGE header field is present in the
request, the response shall include a CONTENT-LANGUAGE header field to identify the
page's language.
It is recommended that fully qualified URLs to resources on the device are not embedded in
HTML presentation pages, but that relative URLs are used instead, so that the host portion of
the embedded URLs does not need to be modified when sent on different UPnP-enabled
interfaces.

プレゼンテーションページは、ローカライジングHTMLによって提供されるメカニズム(例えばcharset属性のMETAタグ)を使用するべきである。
コントロールポイントは、ローカライズされたプレゼンテーションページの取得のために、HTTPのACCEPT-LANGUAGEとCONTENT-LANGUAGE特性を使用するべきである。
具体的に、コントロールポイントはプレゼンテーションページのリクエスト内にHTTP ACCEPT-LANGUAGEヘッダフィールドを含むことができる;
もしACCEPT-LANGUAGEヘッダフィールドがリクエスト内にあるなら、レスポンスはページの言語を識別するCONTENT-LANGUAGEヘッダを含むものとする。
デバイス上のリソースの省略されていないURLは、HTMLプレゼンテーションページに埋め込まれないことが推奨される。
代わりに相対URLが使用される。
異なるUPnP可能インタフェース上で送信されるとき、埋め込みURLのホスト部分を変更する必要がないようにするためである。

### 5.1 リファレンス

RFC 3986, Uniform Resource Identifiers (URI): Generic Syntax. 
http://www.ietf.org/rfc/rfc3986.txt.

HTML, HyperText Markup Language.
 http://www.w3.org/TR/html4.

XHTML™ Basic. 
http://www.w3.org/TR/xhtml-basic/.
