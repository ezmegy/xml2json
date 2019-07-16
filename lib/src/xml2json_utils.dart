/*
 * Package : xml2json
 * Author : S. Hamblett <steve.hamblett@linux.com>
 * Date   : 12/09/2013
 * Copyright :  S.Hamblett@OSCF
 *
 * General utility class
 * 
 */

part of xml2json;

class _Xml2JsonUtils {
  /// Escape any control characters and quotes for JSONencoding
  static String escapeTextForJson(String text) {
    String text1 = text.replaceAll(RegExp('\\[^n\'\"\&rtb]'), '\\\\');
    text1 = text1.replaceAll('\n', '\\\\n');
    text1 = text1.replaceAll("\'", "\\\\'");
    text1 = text1.replaceAll('"', '\\"');
    text1 = text1.replaceAll('\&', '\\\\&');
    text1 = text1.replaceAll('\r', '\\\\r');
    text1 = text1.replaceAll('\t', '\\\\t');
    text1 = text1.replaceAll('\b', '\\\\f');

    return text1;
  }

  /// Turn the processing node into a map of values.
  static Map<String, String> mapProcessingNode(String text) {
    final Map<String, String> nodeMap = Map<String, String>();
    String text1 = text.trim();
    text1 = text1.replaceAll('"', '');
    final List<String> properties = text1.split(' ');
    for (dynamic element in properties) {
      final List<String> elementList = element.split('=');
      if (elementList.length == 2) {
        nodeMap[elementList[0]] = elementList[1];
      }
    }

    return nodeMap;
  }

  /// Prepare the input XML string, close up tags, strip newlines between tags etc.
  static String prepareXmlString(String xmlString) {
    String xmlString1 = xmlString.trim();
    xmlString1 = xmlString1.replaceAll('>\n', '>');
    final RegExp regex = RegExp(r'>\s*<');
    return xmlString1 = xmlString1.replaceAll(regex, '><');
  }
}
