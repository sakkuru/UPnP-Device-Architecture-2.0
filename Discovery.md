---
layout: page
title: Discovery
date: 2015-05-05
repository: UPnP-Device-Architecture-2.0
---

# 1 ディスカバリ

<!-- 
Discovery is Step 1 in UPnP™ networking. Discovery comes after addressing (Step 0) where devices get a network address. Through discovery, control points find interesting device(s). Discovery enables description (Step 2) where control points learn about device capabilities, control (Step 3) where a control point sends commands to device(s), eventing (Step 4) where control points listen to state changes in device(s), and presentation (Step 5) where control points display a user interface for device(s).
 -->

<!-- 
Discovery is the first step in UPnP networking. When a device is added to the network, the UPnP discovery protocol allows that device to advertise its services to control points on the network. Similarly, when a control point is added to the network, the UPnP discovery protocol allows that control point to search for devices of interest on the network. The fundamental exchange in both cases is a discovery message containing a few, essential specifics about the device or one of its services, e.g., its type, universally unique identifier, a pointer to more detailed information and optionally parameters that identify the current state of the device.
 -->

<!-- 
When a device knows it is newly added to the network, it shall multicast a number of discovery messages advertising itself, its embedded devices, and its services (initial announce). Any interested control point can listen to the standard multicast address for notifications that new capabilities are available. A multi-homed device shall multicast the discovery messages on all UPnP-enabled interfaces. A multi-homed control point is allowed to listen to the standard multicast address on one, some or all of its UPnP-enabled interfaces.
 -->
<!-- 
When a new control point is added to the network, it is allowed to multicast a discovery message searching for interesting devices, services, or both. All devices shall listen to the standard multicast address for these messages and shall respond if any of their root devices, embedded devices or services matches the search criteria in the discovery message. In addition, a control point is allowed to unicast a discovery message to a specific IP address on port 1900 or on the port specified by the optional SEARCHPORT.UPNP.ORG header field (which supersedes port 1900 for this use), searching for a UPnP device or service at that specific IP address. This action presumes the control point already knows the device at this IP address is a UPnP device (which listens on the appropriate port). The control point can use unicast search for a number of applications. A unicast search can quickly confirm a specific device and provide the corresponding discovery information (e.g. UUID, URL) of this device.
 -->

<!-- 
All devices shall listen to incoming unicast search messages on port 1900 or, if provided, the port number specified in the SEARCHPORT.UPNP.ORG header field and shall respond if any of their root devices, embedded devices or services matches the search criteria in the discovery message.
 -->

<!-- 
A multi-homed control point is allowed to multicast discovery messages on one, some or all of its UPnP-enabled interfaces. Multi-homed devices shall listen to the standard multicast address on all UPnP-enabled interfaces for multicast discovery messages. Multi-homed devices shall also listen to incoming unicast search messages on port 1900 or, if provided, the port number specified in the SEARCHPORT.UPNP.ORG header field. The devices shall respond if any of their root devices, embedded devices or services matches the search criteria in the discovery message.
 -->

<!-- 
To reiterate, a control point is allowed to learn of a device of interest because that device sent discovery messages advertising itself or because the device responded to a discovery message searching for devices. In either case, if a control point is interested in a device and wants to learn more about it, the control point uses the information in the discovery message to send a description query message. The clause on Description explains description messages in detail.
 -->

<!-- 
When a device is removed from the network, it should, if possible, multicast a number of discovery messages revoking its earlier announcements, effectively declaring that its root devices, embedded devices and services will no longer be available. When the IP address of a device is changed, it should revoke any earlier announcements and it shall advertise using the new IP address.
 -->
<!-- 
When a multi-homed device becomes unavailable to the network on any of its UPnP-enabled interfaces, it should, if possible, multicast a number of discovery messages revoking its earlier announcements on the affected UPnP-enabled interfaces, effectively declaring that its root devices, embedded devices and services will no longer be available on those interfaces. If it remains available to the network on any of its other UPnP-enabled interfaces, it shall NOT multicast such discovery messages on the unaffected UPnP-enabled interfaces.
 -->

<!-- 
When a multi-homed device becomes available to the network on a new UPnP-enabled interface (in addition to any existing UPnP-enabled interfaces), it shall increase its BOOTID.UPNP.ORG field value (see clause 1.2 “Advertisement”), and multicast a number of update messages on the existing UPnP-enabled interfaces to announce the new BOOTID.UPNP.ORG field value. After all the update messages have been sent, it shall multicast a number of discovery messages on all (existing and new) UPnP-enabled interfaces with the new BOOTID.UPNP.ORG field value.
 -->

<!-- 
Similarly, when one of the IP addresses of a multi-homed device is changed, it should revoke any earlier announcements on the previous IP address. It shall increase its BOOTID.UPNP.ORG field value (see clause 1.2 “Advertisement”), and multicast a number of update messages on the existing UPnP-enabled interfaces to announce the new BOOTID.UPNP.ORG field value. After all the update messages have been sent, it shall multicast a number of discovery messages on all (existing and new) UPnP-enabled interfaces with the new BOOTID.UPNP.ORG field value.
 -->

<!-- 
Finally, if a multi-homed device loses connectivity on one of its UPnP-enabled interfaces and then regains connectivity, it shall increase its BOOTID.UPNP.ORG field value (see 1.2, “Advertisement”), and multicast a number of update messages on the unaffected UPnP-enabled interfaces to announce the new BOOTID.UPNP.ORG field value. After all the update messages have been sent, it shall multicast a number of discovery messages on all (affected and unaffected) UPnP-enabled interfaces with the new BOOTID.UPNP.ORG field value.
 -->

<!-- 
To limit network congestion, the time-to-live (TTL) of each IP packet for each multicast message should default to 2 and should be configurable. When the TTL is greater than 1, it is possible for multicast messages to traverse multiple routers; therefore control points and devices using non-AutoIP addresses shall send an IGMP Join message so that routers will forward multicast messages to them (this is not necessary when using an Auto-IP address, since packets with Auto-IP addresses will not be forwarded by routers).
 -->

<!-- 
Versioning: Discovery plays an important role in the interoperability of devices and control points using different versions of UPnP networking. The UPnP Device Architecture (defined herein) is versioned with both a major and a minor version, usually written as major.minor, where both major and minor are integers (for example, version 2.10 [two dot ten] is newer than version 2.2 [two dot two]). Advances in minor versions shall be a compatible superset of earlier minor versions of the same major version. Advances in major version are not required to be supersets of earlier versions and are not guaranteed to be backward compatible. However UDA version 2.0 is specified as a superset of UDA 1.1 and is thus backwards compatible with UDA 1.x versions. Therefore UDA 2.0 control points shall maintain interoperability with UDA 1.x devices. UDA 1.x control points can work with UDA 2.0 devices, but can’t access the additional functionality specified in UDA 2.0. Version information is communicated in discovery and description messages. Discovery messages include the version of UPnP networking that the devices and control points support (in the SERVER and USER-AGENT header fields); the version of device and service types supported is also included in relevant discovery messages. Additionally, description documents also include the same information. SERVER and USER-AGENT header fields are also used in control and eventing to communicate which version of UPnP networking the devices and control points support. This clause explains the format of version information in discovery messages and specific requirements on discovery messages to maintain compatibility with advances in minor versions.
 -->

<!-- 
The remainder of this clause explains the UPnP discovery protocol known as SSDP (Simple Service Discovery Protocol) in detail, enumerating how devices advertise and revoke their advertisements as well as how control points search and devices respond.
 -->

## 1.1 SSDPメッセージフォーマット

<!-- 
SSDP uses part of the header field format of HTTP 1.1 as defined in RFC 2616. However, it is NOT based on full HTTP 1.1 as it uses UDP instead of TCP, and it has its own processing rules. This subclause defines the generic format of a SSDP message.
 -->

SSDPは、RFC 2616で定義されているHTTP 1.1のヘッダフィールドフォーマットの一部を使用する。
しかし、これはTCPの代わりにUDPを使用したり、自身のプロセスルールを持っていたりするように、完全にHTTP 1.1に基づいているわけではない。

<!-- 
All SSDP messages shall be formatted according to RFC 2616 clause 4.1 “generic message”. SSDP messages shall have a start-line and a list of message header fields. SSDP messages should not have a message body. If a SSDP message is received with a message body, the message body is allowed to be ignored.
 -->

すべてのSSDPメッセージはRFC 2616 4.1節 "generic message"に従った書式であるものとする。
SSDPメッセージは1つのスタートラインと、メッセージヘッダフィールドのリストを持っているものとする。
SSDPメッセージはメッセージボディを持っているべきではない。
もしメッセージボディがあるSSDPメッセージを受信しても、メッセージボディは無視してもよい。


### 1.1.1 SSDP スタートライン

<!-- 
Each SSDP message shall have exactly one start-line. See clause 1.2, “Advertisement” and clause 1.3, “Search” below for the definition of all possible SSDP messages. The start-line shall be formatted either as defined in RFC 2616 clause 5.1 or clause 6.1. Furthermore, the start-line shall be one of the following three:
 -->

SSDPメッセージそれぞれは、1つのスタートラインを持つものとする。
すべてのSSDPメッセージ候補の定義のために、1.2節「Advertisement」と、1.3節「Search」を参照せよ。
スタートラインはRFC 2616の節5.1か節6.1で定義されているようにフォーマットされているものとする。
また、スタートラインは以下の3つのうちの1つであるとする。

```
NOTIFY * HTTP/1.1\r\n
M-SEARCH * HTTP/1.1\r\n
HTTP/1.1 200 OK\r\n
```
<!-- 
As a clarification, while the start-line shall include “HTTP/1.1”, this does not signal that SSDP is fully based on HTTP 1.1; this start-line element is included for backward compatibility reasons only.
 -->

明確化のため、スタートラインが"HTTP/1.1"を含むとはいえ、これはSSDPがすべてHTTP 1.1に基づいていることを示しているわけではない。
このスタートライン要素は後方互換性のためだけに含まれる。


### 1.1.2 SSDPメッセージヘッダフィールド

<!-- 
The message header fields in a SSDP message shall be formatted according to RFC 2616 clause 4.2. This specifies that each message header field consist of a case-insensitive field name followed by a colon (":"), followed by the case-sensitive field value. SSDP restricts allowed field values.
 -->

SSDPメッセージのメッセージヘッダフィールドはRFC 2615の4.2節に従ってフォーマットされることとする。
これは、コロン(":")が続く大文字小文字を区別しないフィールドネームと、その後の大文字小文字を区別しないフィールド値からなる、それぞれのメッセージフィールドを指定する。
SSDPは許可するフィールド値を制限する。

<!-- 
Example SSDP header:
 -->

SSDPヘッダの例:

```
HOST: 239.255.255.250:1900
```

### 1.1.3 SSDPヘッダフィールド拡張

<!-- 
UPnP working committees and UPnP vendors are allowed to extend SSDP messages with additional SSDP header fields. Additional message header fields can also be defined by the UPnP Forum Technical committee (e.g. clause 1.2, “Advertisement” defines BOOTID.UPNP.ORG, CONFIGID.UPNP.ORG, NEXTBOOTID.UPNP.ORG, and SEARCHPORT.UPNP.ORG header fields). To prevent name-clashes of header field definitions (two parties accidentally define the same header field name with different semantics), vendor-defined header field names shall have the following format:
 -->

UPnPワーキング委員会とUPnPベンダは、追加のSSDPヘッダフィールドによるSSDPメッセージの拡張を許可されている。
追加のメッセージヘッダフィールはまた、UPnP Forum Technical committeeによって定義されることもある（例: 節1.2"Advertisement"は、BOOTID.UPNP.ORG, CONFIGID.UPNP.ORG, NEXTBOOTID.UPNP.ORG, SEARCHPORT.UPNP.ORGヘッダフィールドを定義する）。
ヘッダフィールド定義の名前衝突（2つのパーティが偶然、異なる意味論を持つ同じヘッダフィールド名を定義する）を防ぐため、ベンダー定義のヘッダフィールドネームは以下のフォーマットを持つこととする:

```
field-name = token "." domain-name
```
<!-- 
where the domain-name shall be Vendor Domain Name, and in addition shall satisfy the token format as defined in RFC 2616, clause 2.2.
 -->

 domain-nameはベンダードメイン名であるとし、さらにRFC 2616の節2.2で定義されているトークンフォーマットを満たすものとする。

<!-- 
Example vendor-defined SSDP header fields:
 -->

ベンダー定義のSSDPヘッダフィールドの例:

```
myheader.philips.com: "some value"
myheader.sony.com: "other value"
```

### 1.1.4 UUIDフォーマットと推奨される生成アルゴリズム

<!-- 
UPnP 2.0 devices shall format UUIDs according to the format specified below. However, UPnP 2.0 control points shall also be able to accept UUIDs that have not been formatted according to the rules specified below, as formatting rules are not specified in UPnP 1.0 other than the requirement that a UUID is a string.
 -->

UPnP 2.0デバイスは、以下で指定されるフォーマットに従うUUIDのフォーマットするものとする。
しかし、UPnP 2.0コントロールポイントはまた、下記で示されるルールに従ってフォーマットされていないUUID（UUIDが文字列であるという要件以外で、UPnP 1.0で指定されないルールでフォーマットされているような）も受け入れることができるものとする。

<!-- 
UUIDs are 128 bit numbers that shall be formatted as specified by the following grammar (taken from [1]):
 -->

UUIDは、以下の文法によって示されるようにフォーマットされているものとする、128bitの数字である。

```
UUID = 4 * <hexOctet> "-" 2 * <hexOctet> "-" 2 * <hexOctet> "-" 2 * <hexOctet> "-" 6 * <hexOctet>
hexOctet = <hexDigit> <hexDigit>
hexDigit = "0"|"1"|"2"|"3"|"4"|"5"|"6"|"7"|"8"|"9"|"a"|"b"|"c"|"d"|"e"|"f"|"A"|"B"|"C"|"D"|"E"|"F"
```
<!-- 
The following is an example of the string representation of a UUID:
 -->

下記はUUIDの文字列表現の例である。

```
"2fac1234-31f8-11b4-a222-08002b34c003"
```
<!-- 
UUIDs are allowed to be generated using any suitable generation algorithm2 that satisfies the following requirements:
 -->

UUIDは、以下の要件を満たすいかなるふさわしい生成アルゴリズムを使用して生成されることも許可されている。

<!-- 
a) It is very unlikely to duplicate a UUID generated from some other resource.
b) It maps down to a 128-bit number.
c) UUIDs shall remain fixed over time.
 -->

a) ある他のリソースから生成されたUUIDと重複する可能性は極めて低い。
b) 128bitの数字になるまで計画する。
c) UUIDは長い間固定のままである。

<!-- 
The following UUID generation algorithm is recommended:
 -->

以下のUUID生成アルゴリズムが推奨される:

<!-- 
Time & MAC-based algorithm as specified in [1], where the UUID is generated once and stored in non-volatile memory if available.
 -->

[1]に記載されている時間とMACベースのアルゴリズム。これによりUUIDが一度生成され、可能であれば非揮発性のメモリに記憶される。


### 1.1.5 SSDPプロセスルール

<!-- 
When an SSDP message is received that is not formatted according to clause 1.1, “SSDP message format” (the clauses above), receivers should silently discard the message. Receivers are allowed to try to parse such SSDP messages to try to interoperate.
 -->

節1.1 "SSDPメッセージフォーマット"に従ってフォーマットされていないSSDPメッセージを受信した場合、受信者はそのメッセージを黙って破棄すべきである。
受信者は相互運用しようと、そのようなSSDPメッセージのパースを試みることもできる。

<!-- 
When parsing SSDP header fields, receivers shall parse all required SSDP-defined header fields (see clause 1.2, “Advertisement” and clause 1.3, “Search” below) and are allowed to skip all other header fields. Receivers shall be able to skip header fields they do not understand.
 -->

SSDPヘッダフィールドをパースするとき、受信者はすべての必須SSDP定義済みヘッダフィールドをパースするものとし、他のすべてのヘッダフィールドはスキップすることができる。
受信者は理解できないヘッダフィールドをスキップすることができる。


## 1.2 広告

When a device is added to the network, the device advertises its services to control points. It does this by multicasting discovery messages to a standard address and port (239.255.255.250:1900). Control points listen to this port to detect when new capabilities are available on the network. To advertise the full extent of its capabilities, a device shall multicast a number of discovery messages corresponding to each of its root devices, embedded devices and services. Each message contains information specific to the embedded device (or service) as well as information about its enclosing device. Messages shall include duration until the advertisements expire; if the device remains available, the advertisements shall be re-sent (with new duration). If the device becomes unavailable, the device should explicitly cancel its advertisements, but if the device is unable to do this, the advertisements will expire on their own. If a multi-homed device becomes unavailable on some, but not all, of its UPnP-enabled interfaces, the device should explicitly cancel its advertisements on the affected UPnP-enabled interfaces (but NOT on the unaffected UPnP-enabled interfaces), but if the device is unable to do this, the advertisements on those interfaces or IP addresses will expire on their own. In addition, messages include the following header fields defined in this document: BOOTID.UPNP.ORG, NEXTBOOTID.UPNP.ORG, CONFIGID.UPNP.ORG, SEARCHPORT.UPNP.ORG. The field value of the BOOTID.UPNP.ORG header field shall be increased each time a device (re)joins the network and sends an initial announce (a “reboot” in UPnP terms), or adds a UPnP-enabled interface.


デバイスがネットワークに追加されたとき、デバイスはそのサービスをコントロールポイントに広告する。
標準アドレスとポート(239.255.255.250:1900)にディスカバリメッセージをマルチキャストで送信することで、これを行う。
新しい候補がネットワークで使用可能になったとき、これを検知するためコントロールポイントはこのポートをリッスンする。
機能の全てを広告するため、デバイスはroot deviceそれぞれに対応して多数のディスカバリメッセージをマルチキャストで送信するものとする。
各メッセージには、エンベデッドデバイスの仕様の情報と、それを同封するデバイスについての情報が含まれる。
メッセージは広告が切れるまでの有効期限を含むものとする。
もしデバイスが使用可能のままであるなら、広告は(新しい有効期限とともに)再送信されるものとする。
もしデバイスが使用不能になったなら、デバイスは明示的にその広告をキャンセルすべきである。
しかしデバイスがそうできない場合、広告はそのまま有効期限が切れるだろう。

<!-- 
Unless the device explicitly announces a change in the BOOTID.UPNP.ORG field value using an SSDP message, as long as the device remains continuously available in the network, the same BOOTID.UPNP.ORG field value shall be used in all repeat announcements, search responses, update messages and eventually bye-bye messages. Control points can parse this header field to detect whether the device has potentially lost its state (event subscriptions will have been lost, DCP specific state may have been changed) due to a “reboot”. Since a device cannot change IP addresses without changing the BOOTID.UPNP.ORG field value, the BOOTID.UPNP.ORG field value can also be used to distinguish multi-homed devices (in this case, a control point will see SSDP messages from different IP addresses with the same UUID, BOOTID.UPNP.ORG field value) from devices that changed IP addresses (in this case, the BOOTID.UPNP.ORG field value will be different). The field value of the NEXTBOOTID.UPNP.ORG header field indicates the field value of the BOOTID.UPNP.ORG header field that a multi-homed device intends to use in future announcements after adding a new UPnP-enabled interface. The field value of the CONFIGID.UPNP.ORG header field identifies the current set of device and service descriptions; control points can parse this header field to detect whether they need to send new description query messages. The field value of the SEARCHPORT.UPNP.ORG header field identifies the port at which the device listens to unicast M-SEARCH messages; control points can parse this header field to know to which port unicast M-SEARCH messages shall be sent. These header fields are explained in detail below.
 -->

もしマルチホームデバイスがいくつか(全てではない)のUPnPが使えるインタフェースで使用不能になった場合、デバイスは明示的に影響のあるUPnPインタフェースで広告をキャンセルするべきである。(影響のないUPnPインタフェースではやらないこと)
しかしデバイスがそうできない場合、それらのインタフェースの広告やIPアドレスは自動的にそのまま切れるだろう。
さらにメッセージは本ドキュメントで定義される以下のメッセージフィールドを含む:
BOOTID.UPNP.ORG,
NEXTBOOTID.UPNP.ORG, CONFIGID.UPNP.ORG, SEARCHPORT.UPNP.ORG.
 BOOTID.UPNP.ORGヘッダフィールドのフィールド値は、ネットワークにデバイスが(再)接続される度に増加し、開始アナウンスを送信するものとする。




### 1.2.1 広告プロトコルと標準

<!-- 
To send (and receive) advertisements, devices (and control points) use the following subset of the overall UPnP protocol stack. (The overall UPnP protocol stack is listed at the beginning of this document.)
 -->

広告の送信(と受信)のため、デバイス(とコントロールポイント)は下記の全UPnPプロトコルスタックの一部を使用する。
(全UPnPプロトコルスタックは本ドキュメントの最初に記載されている。)

<table>
<tr><td>UPnP vendor</td></tr>
<tr><td>UPnP Forum</td></tr>
<tr><td>UPnP Device Architecture</td></tr>
<tr><td>SSDP</td></tr>
<tr><td>UDP</td></tr>
<tr><td>IP</td></tr>
</table>

<!-- 
At the highest layer, discovery messages contain vendor-specific information, e.g., URL for the device description and device identifier. Moving down the stack, vendor content is supplemented by information from a UPnP Forum working committee, e.g., device type. Messages from the layers above are hosted in UPnP-specific protocols, defined in this document. In turn, the SSDP messages are delivered via UDP over IP. For reference, colors in [square brackets] above indicate which protocol defines specific header fields and field values in discovery messages listed below.
 -->

最上位層では、ディスカバリメッセージははベンダ固有の情報を持つ。例えばデバイスディスクリプションのためのURLやデバイスIDなど。
スタックの下位に行くにつれて、ベンダコンテンツはUPnPフォーラムワーキング委員会からの情報によって補完される。例えばデバイスタイプなど。
上位レイヤからのメッセージは、本ドキュメントで定義されるUPnP固有のプロトコルによってホストされる。
同様に、SSDPメッセージはUDP over IPによって配信される。
参考までに、上の図の色はどのプロトコルが固有のヘッダフィールドと、下記に記載したディスカバリメッセージ内のフィールド値を定義しているかを示している。

### 1.2.2 デバイス可用性 - ssdp:aliveを伴うNOTIFY

<!-- 
When a device is added to the network, it shall multicast discovery messages to advertise its root device, any embedded devices, and any services. Each discovery message shall contain four major components:
 -->

デバイスがネットワークに追加されたとき、ルートデバイスやエンベデッドデバイス、そしてサービスの広告のためディスカバリメッセージをマルチキャストで送信する。
ディスカバリメッセージは4つの主な要素を含む:

<!-- 
a) A notification type (e.g., device type), sent in an NT (Notification Type) header field.
b) A composite identifier for the advertisement, sent in a USN (Unique Service Name) header field.
c) A URL for more information about the device (or enclosing device in the case of a service), sent in a LOCATION header field.
d) A duration for which the advertisement is valid, sent in a CACHE-CONTROL header field.
 -->

a) A notification type (e.g., device type), sent in an NT (Notification Type) header field.
b) A composite identifier for the advertisement, sent in a USN (Unique Service Name) header
field.
c) A URL for more information about the device (or enclosing device in the case of a service),
sent in a LOCATION header field.
d) A duration for which the advertisement is valid, sent in a CACHE-CONTROL header field.


a) 通知タイプ(デバイスタイプ等)、NT(Notification Type)ヘッダフィールドに書かれる。

b) 広告のための複合ID、USN(Unique Service Name)ヘッダフィールドに書かれる。

c) デバイス(や、サービスの場会う同封するデバイス)についての詳細な情報のためのURL。LOCATIONヘッダフィールドに書かれる。

d) どの広告が有効か表す有効時間。CACHE-CONTROLヘッダフィールドに書かれる。

<!-- 
To advertise its capabilities, a device multicasts a number of discovery messages. Specifically, a root device shall multicast:
 -->

機能を広告するため、デバイスは多数のディスカバリメッセージをマルチキャスト送信する。
厳密に言えば、ルートデバイスは、以下をマルチキャスト送信するものとする:

<!-- 
Three discovery messages for the root device.
 -->

* 3つのディスカバリメッセージ





<table>
<tr><td></td><td>NT</td><td>USN(a)</td></tr>
<tr>
  <td>1</td>
  <td>upnp:rootdevice</td>
  <td>uuid:device-UUID::upnp:rootdevice</td>
</tr>
<tr>
  <td>2</td>
  <td>uuid:device-UUID(b)</td>
  <td>uuid:device-UUID (for root device UUID)</td>
</tr>
<tr>
  <td>2</td>
  <td>urn:schemas-upnp-org:device:deviceType:ver<br>
  もしくは<br>
  urn:domain-name:device:deviceType:ver</td>
  <td>uuid:device-UUID::urn:schemas-upnporg:device:deviceType:ver<br>
  もしくは<br>
  uuid:device-UUID::urn:domain-name:device:deviceType:ver</td>
</tr>
<tr>
  <td colspan=3>
    <p>(a):USNヘッダフィールドのプレフィクス(2つのコロンの前)は、デバイスディスクリプションのUDN要素の値と一致するものとする。
    (節2「ディスクリプション」でUDN要素について説明している。)
    <p>(b):NTヘッダフィールドのフィールド値は、デバイスディスクリプションのUDN要素の値と一致するものとする。
  </td>
</tr>
</table>

<!-- 
Two discovery messages for each embedded device.
 -->

* 各埋め込みデバイスのための2つのディスカバリメッセージ

<table>
<tr><td></td><td>NT</td><td>USN(a)</td></tr>
<tr>
  <td>1</td>
  <td>
  uuid:device-UUID(b)
  </td>
  <td>
  uuid:device-UUID
  </td>
</tr>
  <td>2</td>
  <td>
  urn:schemas-upnporg:service:serviceType:ver<br>
  もしくは<br>
  urn:domain-name:service:serviceType:ver
  </td>
  <td>
  uuid:device-UUID::urn:schemas-upnporg:service:serviceType:ver<br>
  もしくは<br>
  uuid:device-UUID::urn:domainname:service:serviceType:ver
  </td>
</tr>
<tr>
  <td colspan=3>
    <p>a:USNヘッダフィールドのプレフィクス(2つのコロンの前)は、デバイスディスクリプションのUDN要素の値と一致するものとする。
    (節2「ディスクリプション」でUDN要素について説明している。)
    <p>b:NTヘッダフィールドのフィールド値は、デバイスディスクリプションのUDN要素の値と一致するものとする。
  </td>
</tr>
</table>

<!-- 
Once for each service type in each device.
 -->

* 各デバイスのサービスタイプそれぞれに対して1つ

<table>
<tr><td></td><td>NT</td><td>USN(a)</td></tr>
<tr>
  <td>1</td>
  <td>
  urn:schemas-upnporg:service:serviceType:ver<br>
もしくは<br>
urn:domain-name:service:serviceType:ver
  </td>
  <td>
  uuid:device-UUID::urn:schemas-upnporg:service:serviceType:ver<br>
もしくは<br>
uuid:device-UUID::urn:domainname:service:serviceType:ver
  </td>
</tr>
<tr>
  <td colspan=3>
    <p>(a):NTヘッダフィールドのフィールド値は、デバイスディスクリプションのUDN要素の値と一致するものとする。
  </td>
</tr>
</table>


If a root device has d embedded devices and s embedded services but only k distinct service types, this works out to 3+2d+k requests. If a particular device or embedded device contains multiple instances of a particular service type, it is only necessary to advertise the service type once (rather than once for each instance). Note that if two embedded devices contain a service of the same service type, these services shall still be separately announced. This advertises the full extent of the device's capabilities to interested control points. These messages shall be sent out as a series with roughly comparable expiration times; order is unimportant, but refreshing or canceling individual messages is PROHIBITED.uytAQXd

ルートデバイスにd個の埋め込みデバイスと、s個の埋め込みサービスがあるが、k個のサービスタイプしかない場合、結局3+2d+k回のリクエストとなる。
もし特定のデバイスや埋め込みデバイスが、ある一つのサービスタイプの複数のインスタンスを含む場合、(各インスタンスに対して一度ではなく)サービスタイプに対して一度しか広告する必要がない。
2つの埋め込みデバイスが同じサービスタイプのサービスを含む場合、それらのサービスは別々にアナウンスされることに注意。
これにより、興味のあるコントロールポイントに対して、デバイスの機能の全てを広告する。
これらのメッセージは有効期限と同じくらいタイミングで連続して送信されるものとする。
順番は重要ではないが、個々のメッセージをリフレッシュしたりキャンセルすることは"禁止"されている。


Updated UPnP device and service types are required to be fully backward compatible with
previous versions of the same type. Devices shall advertise the highest supported version of
each supported type. For example, if a device supports version 2 of the “Audio” service, it
would advertise only version 2, even though it also supports version 1. It shall NOT advertise
additional supported versions. Control points that support a given version of a device or
service are able to also interact with higher versions because of this backward compatibility
requirement, but only using the functionality that was defined in the lower version. For
example, if a control point supports only version “1” of the “Audio” service, and a device
advertises that it supports version “2” of the “Audio” service, the control point shall recognize
the device and be able to use it.

最新のUPnPデバイスとサービスタイプは、以前のバージョンの同じタイプとの完全な後方互換性が要求される。
デバイスは、それぞれのサポートするタイプの最も高いバージョンを広告するものとする。
例えば、デバイスがバージョン2の「オーディオ」サービスをサポートする場合、バージョン1をサポートしていたとしても、バージョン2だけを広告する。
追加のサポートするバージョンは広告しないものとする。
伝えられたデバイスやサービスのバージョンをサポートするコントロールポイントは、より高いバージョンとのやりとりも可能である。
これは後方互換性の要件のためであるが、低いバージョンで定義された機能を使ってのみである。
例えばコントロールポイントが「オーディオ」サービスのバージョン1のみサポートし、デバイスが「オーディオ」サービスのバージョン2をサポートすると広告している場合、コントロールポイントはデバイスを認識し、それを使うことができる。


Choosing an appropriate duration for advertisements is a balance between minimizing
network traffic and maximizing freshness of device status. Relatively short durations close to
the minimum of 1800 seconds will ensure that control points have current device status at the
expense of additional network traffic; longer durations, say on the order of a day, compromise
freshness of device status but can significantly reduce network traffic. Generally, device
vendors should choose a value that corresponds to expected device usage: short durations
for devices that are expected to be part of the network for short periods of time, and
significantly longer durations for devices expected to be long-term members of the network.
Devices that frequently connect to and leave the network (such as mobile wireless devices)
should use a shorter duration so that control points have a more accurate view of their
availability. Advertisements in a set (both initial and subsequent) should have comparable
durations. Advertisements in the initial set should be sent as quickly as possible. Subsequent
refreshments of the advertisements are allowed to be spread over time rather than being sent
as a group.

広告の適切な有効期限を選択するには、ネットワークトラフィックの最小化とデバイス状態の鮮度の最大化の間のバランスである。
最小1800秒に近い比較的短い有効期限は、より多くのネットワークトラフィックを犠牲にして、コントロールポイントが現在のデバイス状態を保持することを確かにする。
長い有効期限、日単位のオーダーは、デバイス状態の鮮度を犠牲にするが、著しくネットワークトラフィックを減らすだろう。

一般的にデバイスベンダは想定されるデバイス用とに応じた値を選択すべきである:
デバイスの短い有効期限は、短い期間ネットワークの一部となることが想定され、極端に長い有効期限は、長い時間ネットワークのメンバになることが想定される。
頻繁にネットワークに接続、離脱を行うデバイス(モバイル無線機器など)は、コントロールポイントがより確かな可用性を知るために、より短い有効期限を用いるべきである。
(最初と後続の)一連の広告は同等な有効期限を持つべきである。
最初の広告は可能な限りすぐ送信されるべきである。
後続の広告のリフレッシュは、一斉送信されるよりは、時間をかけて送信してよい。


Spreading refreshments of advertisements over time rather than being sent as a group
improves reliability in case there are network glitches: without increasing the total network
load it increases the frequency of sending announcements from devices to control points. The
two figures below show the announcement behavior without spreading and with spreading the

messages over the entire interval. The figures show a timeline from the moment a device joins
the network, sends its initial announcements (represented by vertical lines), and subsequently
periodically sends repeat announcements. In the second figure, these repeat announcements
are spread over the entire period rather than sent as a bunch.


時間をかけた広告のリフレッシュの拡散は、一斉送信よりネットワーク異常がある場合の信頼性を向上させる:
デバイスからコントロールポイントへのアナウンス送信の頻度を上げるネットワーク負荷のトータルを増加させない。
下記の2つの図は、拡散しないアナウンスと、全区間でメッセージを拡散した場合の振る舞いを表す。
図はデバイスがネットワークに参加した瞬間から、最初のアナウンス(垂直線で表される)を送信し、それ以降定期的にアナウンスを繰り返したときのタイムラインを表す。
2つ目の図では、繰り返されたアナウンスは、一度に送信した場合より全区間に拡散している。

Devices should wait a random interval (e.g. between 0 and 100milliseconds) before sending
an initial set of advertisements in order to reduce the likelihood of network storms; this
random interval should also be applied on occasions where the device obtains a new IP
address or a new UPnP-enabled interface is installed.

デバイスは、ネットワークストープの可能性を減らすため、最初の広告群を送信する前にランダム時間(例: 0~100ms程度) 待機すべきである;
このランダム時間は、デバイスが新しいIPアドレスを獲得、もしくは新しいUPnP可能インタフェースがインストールされた場合も適用されるべきである。


Due to the unreliable nature of UDP, devices should send the entire set of discovery
messages more than once with some delay between sets e.g. a few hundred milliseconds. To
avoid network congestion discovery messages should not be sent more than three times. In
addition, the device shall re-send its advertisements periodically prior to expiration of the
duration specified in the CACHE-CONTROL header field; it is Recommended that such
refreshing of advertisements be done at a randomly-distributed interval of less than one-half
of the advertisement expiration time, so as to provide the opportunity for recovery from lost
advertisements before the advertisement expires, and to distribute over time the
advertisement refreshment of multiple devices on the network in order to avoid spikes in
network traffic. Note that UDP packets are also bounded in length (perhaps as small as 512
Bytes in some implementations); each discovery message shall fit entirely in a single UDP
packet. There is no guarantee that the above 3+2d+k messages will arrive in a particular
order.

UDPの信頼できない性質のため、デバイスはディスカバリメッセージ群全てを、少しの遅延(数100ms)を置いて一度以上送信すべきである。
ネットワーク混雑を避けるため、ディスカバリメッセージは3回以上送信されるべきである。
さらにデバイスは、CACHE-CONTROLヘッダ内に指定される有効期限が切れるに先立って、定期的に広告を再送信するものとする;
広告の有効期限の半分より小さい間隔でランダムに分散された広告のリフレッシュが推奨される。
ロストした広告かrリカバリするための機会を提供するため、広告が切れる前に、ネットワークトラフィックの急上昇を避けるため、ネットワーク内の複数のデバイスの広告のリフレッシュは時間をかけて分散する。
UDPパケットは長さに制限(実装によっては512バイトくらいの大きさ)があることに留意せよ;
各ディスカバリメッセージは一つのUDPパケットに全ておさまるものとする。
上の3+2d+kメッセージが特定の順序で到達する保証はない。

A multi-homed device shall perform the above announcement procedures on each of its
UPnP-enabled interfaces. Advertisements sent on multiple UPnP-enabled interfaces shall
contain the same field values except for the HOST, CACHE-CONTROL and LOCATION
header fields. The HOST field value of an advertisement shall be the standard multicast
address specified for the protocol (IPv4 or IPv6) used on the interface. The URL specified by
the LOCATION header field shall be reachable on the interface on which the advertisement is
sent. Finally, advertisements sent on different interfaces are allowed to have different
CACHE-CONTROL field values and are allowed to be sent with different frequencies.

マルチホームデバイスは、UPnP可能インタフェースごとに上記アナウンス手順を実行するものとする。
複数のUPnP可能インタフェースで送信される広告は、HOST、CACHE-CONTROLおよびLOCATIONヘッダフィールドを除いて同じフィールド値を持つ。
広告のHOSTフィールド値は、インタフェースで使用されるプロトコル(IPv4かIPv6)で指定される標準マルチキャストアドレスであるべきである。
LOCATIONヘッダで指定されるURLは、広告が送信されるインタフェースから到達可能であるべきである。
最後に、異なるインタフェースから送信される広告は、異なるCACHE-CONTROLフィールド値を持つことができ、また異なる頻度で送信されることが許可される。

When a device is added to the network, it shall send a multicast message with method
NOTIFY and ssdp:alive in the NTS header field in the following format. Values in italics are
placeholders for actual values.

デバイスがネットワークに追加された時、下記に示すようにNOTIFYメソッドで、NTSヘッダフィールドにssdp:aliveが指定されたマルチキャストメッセージを送信するものとする。
イタリック体の値は実際の値のためのプレイスホルダである。





NOTIFY * HTTP/1.1<br>
HOST: 239.255.255.250:1900<br>
CACHE-CONTROL: max-age = <i>seconds until advertisement expires</i><br>
LOCATION: <i>URL for UPnP description for root device</i><br>
NT: <i>notification type</i><br>
NTS: ssdp:alive<br>
SERVER: <i>OS/version UPnP/2.0 product/version</i><br>
USN: <i>composite identifier for the advertisement</i><br>
BOOTID.UPNP.ORG: <i>number increased each time device sends an initial announce or an update message</i><br>
CONFIGID.UPNP.ORG: <i>number used for caching description information</i><br>
SEARCHPORT.UPNP.ORG: <i>number identifies port on which device responds to unicast M-SEARCH</i><br>

Note: No body is sent for messages with method NOTIFY, but note that the message shall
have a blank line following the last header field.
The TTL for the IP packet should default to 2 and should be configurable.
Listed below are details for the request line and header fields appearing in the listing above.
Field names are not case sensitive. All field values are case sensitive except where noted.

NOTIFYメソッドのメッセージにボディはない。
しかしメッセージの最後のヘッダフィールドの後には空行が入るものとする。

IPパケットのTTLはデフォルトで2であり、設定可能であるべきである。

以下に、上記リクエストラインとヘッダフィールドの詳細を記述する。
フィールド名は大文字小文字を区別しない。
全てのフィールド値は、特に記載がない場合、大文字小文字を区別する。


#### リクエストライン

"NOTIFY * HTTP/1.1"であるものとする。

##### NOTIFY

通知とイベントを送信するためのメソッド

##### *
Message applies generally and not to a specific resource. shall be *.
メッセージは大抵当てはまり、特定のリソースを指さない。
*であるものとする。


##### HTTP/1.1

HTTPのバージョン。


#### ヘッダフィールド

##### HOST

Required. Field value contains multicast address and port reserved for SSDP by Internet Assigned Numbers
Authority (IANA). shall be 239.255.255.250:1900. If the port number (“:1900”) is omitted, the receiver shall
assume the default SSDP port number of 1900.

必須。
フィールド値はInternet Assigned Numbers
Authority (IANA)によってSSDPのために確保されているマルチキャストアドレスとポートを含む。
239.255.255.250:1900であるものとする。
もしポート番号(:1900)が省略されるなら、受信者はデフォルトのSSDPポートである1900と見なすものとする。

##### CACHE-CONTROL

Required. Field value shall have the max-age directive (“max-age=”) followed by an integer that specifies the
number of seconds the advertisement is valid. After this duration, control points should assume the device (or
service) is no longer available; as long as a control point has received at least one advertisement that is still
valid from a root device, any of its embedded devices or any of its services, then the control point can assume
that all are available. The number of seconds should be greater than or equal to 1800 seconds (30 minutes),
although exceptions are defined in the text above. Specified by UPnP vendor. Other directives shall NOT be
sent and shall be ignored when received.

必須。
フィールド値はmax-ageディレクティブ("max-age=")を持ち、広告が有効な秒数を表す整数が続くものとする。
この有効期限の後、コントロールポイントはそのデバイス(もしくはサービス)はもう使用することはできないと見なすべきである;
コントロールポイントがルートデバイス、または埋め込みデバイスやそのサービスのいずれかから、少なくとも1つの広告を受信していたなら、コントロールポイントはそれらの全ては使用可能であると見なすことができる。
秒数は1800秒(30分)以上であるべきである。とはいえ例外は上記のテキストで定義されている。
UPnPベンダによって指定される。
他のディレクティブは送信されないものとし、受信した時は無視されるものとする。


##### LOCATION

Required. Field value contains a URL to the UPnP description of the root device. Normally the host portion
contains a literal IP address rather than a domain name in unmanaged networks. Specified by UPnP vendor.
Single absolute URL (see RFC 3986).

必須。
フィールド値はルートデバイスのUPnPディスクリプションのURLを含む。
通常ホスト部分は、管理されていないネットワーク内ではドメイン名ではなく、IPアドレスが入る。
UPnPベンダによって指定される。
単一の絶対URLである(RFC 3986を参照)。

##### NT

Required. Field value contains Notification Type. shall be one of the following. (See Table 1-1, “Root device
discovery messages”, Table 1-2, “Embedded device discovery messages”, and Table 1-3, “Service discovery
messages” above.) Single URI.

必須。
フィールド値はNotification Typeを含む。
以下のうちの一つであるとする。
(表1-1「ルートデバイスディスカバリメッセージ」、表1-2「埋め込みデバイスディスカバリメッセージ」、および表1-2「サースディスカバリメッセージ」を参照。)
単一のULI。


###### upnp:rootdevice

Sent once for root device.

ルートデバイス毎に一度送信される。

###### uuid:device-UUID

Sent once for each device, root or embedded, where device-UUID is specified by the UPnP vendor.
See clause 1.1.4, “UUID format and recommended generation algorithms” for the MANDATORY UUID
format.

各(ルートか埋め込み)デバイス毎に一度送信される。
device-UUIDはUPnPベンダによって指定される。
必須UUIDフォーマットは、節1.1.4「UUIDフォーマットと推奨生成アルゴリズム」を参照。

###### urn:schemas-upnp-org:device:deviceType:ver

Sent once for each device, root or embedded, where deviceType and ver are defined by UPnP Forum
working committee, and ver specifies the version of the device type.


各(ルートか埋め込み)デバイス毎に一度送信される。
deviceTypeとverはUPnPフォーラムワーキング委員会によって定義される。
verはデバイスタイプのバージョンを表す。

###### urn:schemas-upnp-org:service:serviceType:ver
Sent once for each service where serviceType and ver are defined by UPnP Forum working committee
and ver specifies the version of the service type.


各サービスごとに一度送信される。
serviceTypeとverはUPnPフォーラムワーキング委員会によって定義され、verはサービスタイプのバージョンを表す。

###### urn:domain-name:device:deviceType:ver
Sent once for each device, root or embedded, where domain-name is a Vendor Domain Name,
deviceType and ver are defined by the UPnP vendor, and ver specifies the version of the device type.
Period characters in the Vendor Domain Name shall be replaced with hyphens in accordance with
RFC 2141.

各(ルートか埋め込み)デバイス毎に一度送信される。
domain-nameはベンダドメイン名である。
deviceTypeとverはUPnPフォーラムワーキング委員会によって定義される。
verはデバイスタイプのバージョンを表す。
ベンダドメイン名のピリオド文字は、RFC 2141に従ってハイフンで置き換えられるものとする。

###### urn:domain-name:service:serviceType:ver
Sent once for each service where domain-name is a Vendor Domain Name, serviceType and ver are
defined by UPnP vendor, and ver specifies the version of the service type. Period characters in the
Vendor Domain Name shall be replaced with hyphens in accordance with RFC 2141.

各サービスごとに一度送信される。
domain-nameはベンダドメイン名である。
serviceTypeとverはUPnPフォーラムワーキング委員会によって定義される。
verはサービスタイプのバージョンを表す。
ベンダドメイン名のピリオド文字は、RFC 2141に従ってハイフンで置き換えられるものとする。


##### NTS

Required. Field value contains Notification Sub Type. shall be ssdp:alive. Single URI.

必須。
フィールド値はNotification Sub Typeを含。
ssdp:aliveであるものとする。
単一のURI。

##### SERVER

Required. Specified by UPnP vendor. String. Field value shall begin with the following “product tokens”
(defined by HTTP/1.1). The first product token identifes the operating system in the form OS name/OS version,
the second token represents the UPnP version and shall be UPnP/2.0, and the third token identifes the
product using the form product name/product version. For example, “SERVER: unix/5.1 UPnP/2.0
MyProduct/1.0”. 

必須。
UPnPベンダによって指定される。
文字列。
フィールド値は以下の"product tokens"(HTTP/1.1で定義)で始まる。
最初のプロダクトトークンは、OS名/OSバージョンの形式でOSを表す。
2つ目のトークンはUPnPバージョンと表し、UPnP/2.0であるものとする。
3つ目のトークンは製品名/製品バージョンの形式で製品を識別するものである。
例えば、 「SERVER: unix/5.1 UPnP/2.0 MyProduct/1.0」。

##### USN

Required. Field value contains Unique Service Name. Identifies a unique instance of a device or service. shall
be one of the following. (See Table 1-1, “Root device discovery messages”, Table 1-2, “Embedded device
discovery messages”, and Table 1-3, “Service discovery messages” above.) The prefix (before the double
colon) shall match the value of the UDN element in the device description. (Clause 2, “Description” explains
the UDN element.) Single URI.

必須。
フィールド値は、ユニークなサービス名を含む。
デバイスやサービスのインスタンスを識別する。
以下のうちの一つであるものとする。
(表1-1「ルートデバイスディスカバリメッセージ」、表1-2「埋め込みデバイスディスカバリメッセージ」、および表1-2「サースディスカバリメッセージ」を参照。)
プレフィックス(2つのコロンの前)は、デバイスディスクリプション内のUDN要素の値と一致するものとする。
(節2「ディスクリプション」でUDNについて説明している。)
単一URI。


###### uuid:device-UUID::upnp:rootdevice
Sent once for root device where device-UUID is specified by UPnP vendor. See clause 1.1.4, “UUID
format and recommended generation algorithms” for the MANDATORY UUID format.


ルートデバイス毎に一度送信される。
device-UUIDはUPnPベンダによって指定される。
必須UUIDフォーマットは、節1.1.4「UUIDフォーマットと推奨生成アルゴリズム」を参照。

###### uuid:device-UUID
Sent once for every device, root or embedded, where device-UUID is specified by the UPnP vendor.
See clause 1.1.4, “UUID format and recommended generation algorithms”for the MANDATORY UUID
format.

各(ルートか埋め込み)デバイス毎に一度送信される。
device-UUIDはUPnPベンダによって指定される。
必須UUIDフォーマットは、節1.1.4「UUIDフォーマットと推奨生成アルゴリズム」を参照。


###### uuid:device-UUID::urn:schemas-upnp-org:device:deviceType:ver

Sent once for every device, root or embedded, where device-UUID is specified by the UPnP vendor,
deviceType and ver are defined by UPnP Forum working committee and ver specifies version of the
device type. See clause 1.1.4, “UUID format and recommended generation algorithms” for the
MANDATORY UUID format.

各(ルートか埋め込み)デバイス毎に一度送信される。
deviceTypeとverはUPnPフォーラムワーキング委員会によって定義される。
verはデバイスタイプのバージョンを表す。
必須UUIDフォーマットは、節1.1.4「UUIDフォーマットと推奨生成アルゴリズム」を参照。


###### uuid:device-UUID::urn:schemas-upnp-org:service:serviceType:ver
Sent once for every service where device-UUID is specified by the UPnP vendor, serviceType and ver
are defined by UPnP Forum working committee and ver specifies version of the device type. See
clause 1.1.4, “UUID format and recommended generation algorithms” for the MANDATORY UUID
format.


各サービスごとに一度送信される。
serviceTypeとverはUPnPフォーラムワーキング委員会によって定義される。
verはデバイスタイプのバージョンを表す。
必須UUIDフォーマットは、節1.1.4「UUIDフォーマットと推奨生成アルゴリズム」を参照。



###### uuid:device-UUID::urn:domain-name:device:deviceType:ver
Sent once for every device, root or embedded, where device-UUID, domain-name (a Vendor Domain
Name), deviceType and ver are defined by the UPnP vendor and ver specifies the version of the
device type. See clause 1.1.4, “UUID format and recommended generation algorithms” for the
MANDATORY UUID format. Period characters in the Vendor Domain Name shall be replaced by
hyphens in accordance with RFC 2141.


各(ルートか埋め込み)デバイス毎に一度送信される。
device-UUID、domain-name(ベンダドメイン名)、deviceTypeとverはUPnPフォーラムワーキング委員会によって定義される。
verはデバイスタイプのバージョンを表す。
必須UUIDフォーマットは、節1.1.4「UUIDフォーマットと推奨生成アルゴリズム」を参照。
ベンダドメイン名のピリオド文字は、RFC 2141に従ってハイフンで置き換えられるものとする。



###### uuid:device-UUID::urn:domain-name:service:serviceType:ver
Sent once for every service where device-UUID, domain-name (a Vendor Domain Name), serviceType
and ver are defined by the UPnP vendor and ver specifies the version of the service type. See clause
1.1.4, “UUID format and recommended generation algorithms” for the MANDATORY UUID format.
Period characters in the Vendor Domain Name shall be replaced by hyphens in accordance with RFC
2141.


各サービスごとに一度送信される。
device-UUID、domain-name(ベンダドメイン名)、deviceTypeとverはUPnPフォーラムワーキング委員会によって定義される。
verはサービスタイプのバージョンを表す。
必須UUIDフォーマットは、節1.1.4「UUIDフォーマットと推奨生成アルゴリズム」を参照。
ベンダドメイン名のピリオド文字は、RFC 2141に従ってハイフンで置き換えられるものとする。


##### BOOTID.UPNP.ORG

Required. The BOOTID.UPNP.ORG header field represents the boot instance of the device expressed
according to a monotonically increasing value. Its field value shall be a non-negative 31-bit integer; ASCII
encoded, decimal, without leading zeros (leading zeroes, if present, shall be ignored by the recipient) that shall
be increased on each initial announce of the UPnP device or shall be the same as the field value of the
NEXTBOOTID.UPNP.ORG header field in the last sent SSDP update message. Its field value shall remain the
same on all periodically repeated announcements. A convenient mechanism is to set this field value to the time
that the device sends its initial announcement, expressed as seconds elapsed since midnight January 1, 1970;
for devices that have a notion of time, this will not require any additional state to remember or be “flashed”.

必須。
BOOTID.UPNP.ORGヘッダフィールドは、単調増加の値に従って表現されるデバイスのブートインスタンスを表す。
そのフィールド値は31ビットの非負整数であるものとする;
ASCIIエンコードされ、十進、先行ゼロなしであり、UPnPデバイスの最初のアナウンス毎に増加されるものとする。
もしくは最後に送信されたSSDPアップデートメッセージのNEXTBOOTID.UPNP.ORGヘッダフィールドのフィールド値を同じであるものとする。
そのフィールド値は全ての定期的に繰り返されるアナウンスで同じであり続けるものとする。
便利な方法として、このフィールド値をデバイスが最初のアナウンスを送信した時間(1970/1/1からの経過秒)に設定する方法がある;
時間の概念を持つデバイスのため、これは記憶したり点滅させるための追加の状態を必要としない。




However, it is perfectly acceptable to use a simple boot counter that is incremented on every initial

announcement as a field value of this header field. As such, control points shall NOT view this header field as
a timestamp. The BOOTID.UPNP.ORG header field shall be included in all announcements of a root device, its
embedded devices and its services. Unless the device explicitly updates its value by sending an SSDP update
message, as long as the device remains available in the network, the same BOOTID.UPNP.ORG field value
shall be used in all announcements, search responses, update messages and eventually bye-bye messages.
Control points can use this header field to detect the case when a device leaves and rejoins the network
(“reboots” in UPnP terms). It can be used by control points for a number of purposes such as re-establishing
desired event subscriptions, checking for changes to the device state that were not evented since the device
was off-line.

しかし、



##### CONFIGID.UPNP.ORG

##### SEARCHPORT.UPNP.ORG

##### SECURELOCATION.UPNP.ORG



注意: NOTIFYメソッドのメッセージにはレスポンスはない。

#### 1.2.3 デバイス使用不可 - ssdp:byebyeのNOTIFY


When a device and its services are going to be removed from the network, the device should
multicast an ssdp:byebye message corresponding to each of the ssdp:alive messages it
multicasted that have not already expired. If the device is removed abruptly from the network,
it might not be possible to multicast a message. As a fallback, discovery messages shall
include an expiration value in a CACHE-CONTROL field value (as explained above); if not readvertised,
the discovery message eventually expires on its own.

デバイスとそのサービスがネットワークから削除されるとき、デバイスはssdp:byebyeメッセージを、
期限がまだ切れていない各ssdp:aliveメッセージに対応してマルチキャストで送信すべきである。
もしデバイスが突然ネットワークから削除されたなら、メッセージをマルチキャストできないかもしれない。
フォールバックとして、ディスカバリメッセージはCACHE-CONTROLフィールド値に有効期限の値を含むものとする;
もし再広告されないなら、ディスカバリメッセージは最終的にのそのまま期限切れとなる。


(Note: when a control point is about to be removed from the network, no discovery-related
action is required.)

(注意:コントロールポイントがネットワークから削除されようとしているとき、ディスカバリに関連したアクションは必要ない。)

When a device is about to be removed from the network, it should explicitly revoke its
discovery messages by sending one multicast message for each ssdp:alive message it sent.
Each multicast message shall have method NOTIFY and ssdp:byebye in the NTS header
field in the following format. Values in italics are placeholders for actual values.

デバイスがネットワークから削除されようとしているとき、送信済みの各ssdp:aliveメッセージに対して、一つのマルチキャストメッセージを送信することで、明示的にディスカバリメッセージを取り消すべきである。
各マルチキャストメッセージは、下記に示すフォーマットで、NOTIFYメソッドとNTSヘッダフィールドにssdp:byebyeを持つものとする。
イタリック体の値は、実際の値のためのプレイスホルダである。


When a multi-homed device is about to be removed from the network on one or more of its
UPnP-enabled interfaces, it should explicitly revoke its discovery messages by sending one
multicast message for each ssdp:alive message it has previously sent on those interfaces
and IP addresses. It shall NOT send such multicast messages to any of the UPnP-enabled
interfaces that remain available.

マルチホームデバイスが、ひとつ以上のUPnP可能インタフェースでネットワークから削除されようとしているとき、それらのインタフェースとIPアドレスで送信されていたssdp:aliveメッセージそれぞれに対してマルチキャストメッセージを送信することで、明示的にディスカバリメッセージを取り消すべきである。
使用可能であり続けるUPnP可能インタフェースでは、それらマルチキャストメッセージを送信しないものとする。


When ssdp:byebye messages are sent on multiple UPnP-enabled interfaces, the messages
shall contain identical field values except for the HOST field value. The HOST field value of
an advertisement shall be the standard multicast address specified for the protocol (IPv4 or
IPv6) used on the interface. 

ssdp:byebyeメッセージが複数のUPnP可能インタフェースで送信されたとき、メッセージはHOSTフィールド値を除き、identicalフィールド値を含むものとする。
広告のHOSTフィールド値は、インタフェースで使用されるプロトコル(IPv4もしくはIPv6)で指定される標準マルチキャストアドレスであるものとする。

NOTIFY * HTTP/1.1
HOST: 239.255.255.250:1900
NT: notification type
NTS: ssdp:byebye
USN: composite identifier for the advertisement
BOOTID.UPNP.ORG: number increased each time device sends an initial announce or an update
message
CONFIGID.UPNP.ORG: number used for caching description information


Note: No body is present for messages with method NOTIFY, but note that the message shall
have a blank line following the last header field.
The TTL for the IP packet should default to 2 and should be configurable.
Listed below are details for the request line and header fields appearing in the listing above.
Field names are not case sensitive. All field values are case sensitive except where noted.

NOTIFYメソッドのメッセージにボディはない。
しかしメッセージの最後のヘッダフィールドの後には空行が入るものとする。

IPパケットのTTLはデフォルトで2であり、設定可能であるべきである。

以下に、上記リクエストラインとヘッダフィールドの詳細を記述する。
フィールド名は大文字小文字を区別しない。
全てのフィールド値は、特に記載がない場合、大文字小文字を区別する。





#### リクエストライン

"NOTIFY * HTTP/1.1"であるものとする。

##### NOTIFY

通知とイベントを送信するためのメソッド

##### *
Message applies generally and not to a specific resource. shall be *.
メッセージは大抵当てはまり、特定のリソースを指さない。
*であるものとする。


##### HTTP/1.1

HTTPのバージョン。


#### ヘッダフィールド

##### HOST

Required. Field value contains multicast address and port reserved for SSDP by Internet Assigned Numbers
Authority (IANA). shall be 239.255.255.250:1900. If the port number (“:1900”) is omitted, the receiver shall
assume the default SSDP port number of 1900.

必須。
フィールド値はInternet Assigned Numbers
Authority (IANA)によってSSDPのために確保されているマルチキャストアドレスとポートを含む。
239.255.255.250:1900であるものとする。
もしポート番号(:1900)が省略されるなら、受信者はデフォルトのSSDPポートである1900と見なすものとする。


##### LOCATION

Required. Field value shall be the same as the LOCATION field value that has been sent in previous SSDP
messages. Single absolute URL (see RFC 3986).


必須。
フィールド値はそれまでに送信されたSSDPメッセージのLOCATIONフィールド値を同じであるとする。
単一の絶対URLである(RFC 3986を参照)。

##### NT

Required. Field value contains Notification Type. (See list of required field values for the NT header field in
NOTIFY with ssdp:alive above.) Single URI.

必須。
フィールド値はNotification Typeを含む。
(ssdp:aliveを伴うNOTIFY内のNTヘッダフィールドで要求されるフィールド値のリストを参照。)
単一のULI。

##### NTS

Required. Field value contains Notification Sub Type. Shall be ssdp:update. Single URI.

必須。
フィールド値はNotification Sub Typeを含。
ssdp:updateであるものとする。
単一のURI。

##### USN

Required. Field value contains Unique Service Name. (See list of required field values for the USN header field
in NOTIFY with ssdp:alive above.) Single URI.

必須。
フィールド値は、ユニークなサービス名を含む。
(ssdp:aliveを伴うNOTIFY内のUSNヘッダフィールドで要求されるフィールド値のリストを参照。)
単一URI。



##### BOOTID.UPNP.ORG



##### CONFIGID.UPNP.ORG

##### NEXTBOOTID.UPNP.ORG

##### SEARCHPORT.UPNP.ORG

##### SECURELOCATION.UPNP.ORG




注意: NOTIFYメソッドのメッセージにはレスポンスはない。

If a control point has received at least one ssdp:byebye message of a root device, any of its
embedded devices or any of its services then the control point can assume that all are no
longer available. As a fallback, if a control point fails to receive notification that a root device,
its embedded devices and its services are unavailable, the original discovery messages will
eventually expire yielding the same effect. Only when all original advertisements of a root
device, its embedded devices and its services have expired can a control point assume that
they are no longer available.

コントロールポイントがルートデバイス、埋め込みデバイスのいずれか、そのサービスのいずれかの少なくともひとつのssdp:byebyeメッセージを受信したなら、コントロールポイントは、すべてはもはや使用できないとみなすことができる。
フォールバックとして、コントロールポイントがルートデバイス、埋め込みデバイス、そのサービスの使用不能であるとの通知の受信に失敗したなら、オリジナルディスカバリメッセージは最終的に期限が切れて同じ効果を生じさせる。
ルートデバイス、埋め込みデバイス、サービスのすべてのオリジナル広告の期限が切れたときだけ、コントロールポイントはそれらはもはや使用できないとみなすことができる。


If a multi-homed control point receives an ssdp:update message on its UPnP-enabled
interface(s), and the message arrives on the interface(s) that it uses for UPnP
communications with the device (such as event subscriptions), it can assume that the device
has remained continuously available (including all device state), and that the
NEXTBOOTID.UPNP.ORG field value replaces the BOOTID.UPNP.ORG field value that the
control point has previously recorded for the device. It can expect future announcements,
search responses, update messages and eventually bye-bye messages from the device to
contain the “new” BOOTID.UPNP.ORG field value (that is: the field value of the
NEXTBOOTID.UPNP.ORG header field in the received ssdp:update message). The field
value in the NEXTBOOTID.UPNP.ORG header field shall be recorded as the current
BOOTID.UPNP.ORG field value of the device which is to be expected on all subsequent
SSDP messages.


もしマルチホームコントロールポイントがUPnP可能インタフェースでssdp:updateメッセージを受信し、メッセージがデバイスとのUPnPコミュニケーション(イベント購読など)に使われるインタフェースに到達したなら、デバイスは引き続き使用可能であると家庭で気、NEXTBOOTID.UPNP.ORGフィールド値はBOOTID.UPNP.ORGフィールド値に置き換えられる。


If a control point receives an SSDP message with a BOOTID.UPNP.ORG field value different
(either higher or lower) from the value that the control point has previously recorded for the
device,it can assume that the device has become temporarily unavailable on that interface
and has become available again, and any stored state information about the device has
become invalid. It shall treat the device as a newly discovered device.



### 1.3 サーチ

#### 1.3.1 サーチプロトコルと標準

#### 1.3.2 M-SEARCHのサーチリクエスト


```
M-SEARCH * HTTP/1.1
HOST: 239.255.255.250:1900
MAN: "ssdp:discover"
MX: seconds to delay response
ST: search target
USER-AGENT: OS/version UPnP/2.0 product/version
CPFN.UPNP.ORG: friendly name of the control point
CPUUID.UPNP.ORG: uuid of the control point 
```

##### リクエストライン

###### M-SEARCH

###### * 

###### HTTP/1.1


##### ヘッダフィールド

###### HOST


##### MAN

Required by HTTP Extension Framework. Unlike the NTS and ST field values, the field value of the MAN
header field is enclosed in double quotes; it defines the scope (namespace) of the extension. shall be
"ssdp:discover".

HTTP拡張フレームワークによって必須。
NTSやSTフィールド値と違い、MANヘッダフィールドのフィールド値はダブルクォートで囲まれる;
拡張のスコープ(名前空間)を定義する。
"ssdp:discover"であるものとする。


