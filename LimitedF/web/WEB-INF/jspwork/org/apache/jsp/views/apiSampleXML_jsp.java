/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.45
 * Generated at: 2019-10-16 18:48:45 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.views;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class apiSampleXML_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("<script type=\"text/JavaScript\" src=\"/js/jquery-1.8.3.min.js\" ></script>\r\n");
      out.write("\r\n");
      out.write("<script language=\"javascript\">\r\n");
      out.write("function getAddrLoc(){\r\n");
      out.write("\t// 적용예 (api 호출 전에 검색어 체크) \t\r\n");
      out.write("\tif (!checkSearchedWord(document.form.keyword)) {\r\n");
      out.write("\t\treturn ;\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\t$.ajax({\r\n");
      out.write("\t\t url :\"/sample/getAddrApi.do\"\r\n");
      out.write("\t\t,type:\"post\"\r\n");
      out.write("\t\t,data:$(\"#form\").serialize()\r\n");
      out.write("\t\t,dataType:\"xml\"\r\n");
      out.write("\t\t,success:function(xmlStr){\r\n");
      out.write("\t\t\t$(\"#list\").html(\"\");\r\n");
      out.write("\t\t\tvar errCode = $(xmlStr).find(\"errorCode\").text();\r\n");
      out.write("\t\t\tvar errDesc = $(xmlStr).find(\"errorMessage\").text();\r\n");
      out.write("\t\t\tif(errCode != \"0\"){\r\n");
      out.write("\t\t\t\talert(errCode+\"=\"+errDesc);\r\n");
      out.write("\t\t\t}else{\r\n");
      out.write("\t\t\t\tif(xmlStr != null){\r\n");
      out.write("\t\t\t\t\tmakeList(xmlStr);\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t    ,error: function(xhr,status, error){\r\n");
      out.write("\t    \talert(\"에러발생\");\r\n");
      out.write("\t    }\r\n");
      out.write("\t});\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function makeList(xmlStr){\r\n");
      out.write("\tvar htmlStr = \"\";\r\n");
      out.write("\thtmlStr += \"<table>\";\r\n");
      out.write("\t$(xmlStr).find(\"juso\").each(function(){\r\n");
      out.write("\t\thtmlStr += \"<tr>\";\r\n");
      out.write("\t\thtmlStr += \"<td>\"+$(this).find('roadAddr').text()+\"</td>\";\r\n");
      out.write("\t\thtmlStr += \"<td>\"+$(this).find('roadAddrPart1').text()+\"</td>\";\r\n");
      out.write("\t\thtmlStr += \"<td>\"+$(this).find('roadAddrPart2').text()+\"</td>\";\r\n");
      out.write("\t\thtmlStr += \"<td>\"+$(this).find('jibunAddr').text()+\"</td>\";\r\n");
      out.write("\t\thtmlStr += \"<td>\"+$(this).find('engAddr').text()+\"</td>\";\r\n");
      out.write("\t\thtmlStr += \"<td>\"+$(this).find('zipNo').text()+\"</td>\";\r\n");
      out.write("\t\thtmlStr += \"<td>\"+$(this).find('admCd').text()+\"</td>\";\r\n");
      out.write("\t\thtmlStr += \"<td>\"+$(this).find('rnMgtSn').text()+\"</td>\";\r\n");
      out.write("\t\thtmlStr += \"<td>\"+$(this).find('bdMgtSn').text()+\"</td>\";\r\n");
      out.write("\t\thtmlStr += \"<td>\"+$(this).find('detBdNmList').text()+\"</td>\";\r\n");
      out.write("\t\t/** API 서비스 제공항목 확대 (2017.02) **/\r\n");
      out.write("\t\thtmlStr += \"<td>\"+$(this).find('bdNm').text()+\"</td>\";\r\n");
      out.write("\t\thtmlStr += \"<td>\"+$(this).find('bdKdcd').text()+\"</td>\";\r\n");
      out.write("\t\thtmlStr += \"<td>\"+$(this).find('siNm').text()+\"</td>\";\r\n");
      out.write("\t\thtmlStr += \"<td>\"+$(this).find('sggNm').text()+\"</td>\";\r\n");
      out.write("\t\thtmlStr += \"<td>\"+$(this).find('emdNm').text()+\"</td>\";\r\n");
      out.write("\t\thtmlStr += \"<td>\"+$(this).find('liNm').text()+\"</td>\";\r\n");
      out.write("\t\thtmlStr += \"<td>\"+$(this).find('rn').text()+\"</td>\";\r\n");
      out.write("\t\thtmlStr += \"<td>\"+$(this).find('udrtYn').text()+\"</td>\";\r\n");
      out.write("\t\thtmlStr += \"<td>\"+$(this).find('buldMnnm').text()+\"</td>\";\r\n");
      out.write("\t\thtmlStr += \"<td>\"+$(this).find('buldSlno').text()+\"</td>\";\r\n");
      out.write("\t\thtmlStr += \"<td>\"+$(this).find('mtYn').text()+\"</td>\";\r\n");
      out.write("\t\thtmlStr += \"<td>\"+$(this).find('lnbrMnnm').text()+\"</td>\";\r\n");
      out.write("\t\thtmlStr += \"<td>\"+$(this).find('lnbrSlno').text()+\"</td>\";\r\n");
      out.write("\t\thtmlStr += \"<td>\"+$(this).find('emdNo').text()+\"</td>\";\r\n");
      out.write("\t\thtmlStr += \"</tr>\";\r\n");
      out.write("\t});\r\n");
      out.write("\thtmlStr += \"</table>\";\r\n");
      out.write("\t$(\"#list\").html(htmlStr);\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("//특수문자, 특정문자열(sql예약어의 앞뒤공백포함) 제거\r\n");
      out.write("function checkSearchedWord(obj){\r\n");
      out.write("\tif(obj.value.length >0){\r\n");
      out.write("\t\t//특수문자 제거\r\n");
      out.write("\t\tvar expText = /[%=><]/ ;\r\n");
      out.write("\t\tif(expText.test(obj.value) == true){\r\n");
      out.write("\t\t\talert(\"특수문자를 입력 할수 없습니다.\") ;\r\n");
      out.write("\t\t\tobj.value = obj.value.split(expText).join(\"\"); \r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t//특정문자열(sql예약어의 앞뒤공백포함) 제거\r\n");
      out.write("\t\tvar sqlArray = new Array(\r\n");
      out.write("\t\t\t//sql 예약어\r\n");
      out.write("\t\t\t\"OR\", \"SELECT\", \"INSERT\", \"DELETE\", \"UPDATE\", \"CREATE\", \"DROP\", \"EXEC\",\r\n");
      out.write("             \t\t \"UNION\",  \"FETCH\", \"DECLARE\", \"TRUNCATE\" \r\n");
      out.write("\t\t);\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tvar regex;\r\n");
      out.write("\t\tfor(var i=0; i<sqlArray.length; i++){\r\n");
      out.write("\t\t\tregex = new RegExp( sqlArray[i] ,\"gi\") ;\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tif (regex.test(obj.value) ) {\r\n");
      out.write("\t\t\t    alert(\"\\\"\" + sqlArray[i]+\"\\\"와(과) 같은 특정문자로 검색할 수 없습니다.\");\r\n");
      out.write("\t\t\t\tobj.value =obj.value.replace(regex, \"\");\r\n");
      out.write("\t\t\t\treturn false;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\treturn true ;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function enterSearch() {\r\n");
      out.write("\tvar evt_code = (window.netscape) ? ev.which : event.keyCode;\r\n");
      out.write("\tif (evt_code == 13) {    \r\n");
      out.write("\t\tevent.keyCode = 0;  \r\n");
      out.write("\t\tgetAddrLoc(); \r\n");
      out.write("\t} \r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<form name=\"form\" id=\"form\"method=\"post\">\r\n");
      out.write("<input type=\"text\" name=\"currentPage\" value=\"1\"/> <!-- 요청 변수 설정 (현재 페이지. currentPage : n > 0) -->\r\n");
      out.write("<input type=\"text\" name=\"countPerPage\" value=\"10\"/><!-- 요청 변수 설정 (페이지당 출력 개수. countPerPage 범위 : 0 < n <= 100) --> \r\n");
      out.write("<input type=\"text\" name=\"confmKey\" id=\"confmKey\" style=\"width:250px;display:none\" value=\"devU01TX0FVVEgyMDE5MTAxNzAzNDc0NzEwOTA5NjA=\"/><!-- 요청 변수 설정 (승인키) -->\r\n");
      out.write("<input type=\"text\" name=\"keyword\" value=\"\" onkeydown=\"enterSearch();\"/><!-- 요청 변수 설정 (키워드) -->\r\n");
      out.write("<input type=\"button\" onClick=\"getAddrLoc();\" value=\"주소검색하기\"/>\r\n");
      out.write("<div id=\"list\" ></div><!-- 검색 결과 리스트 출력 영역 -->\r\n");
      out.write("</form>\r\n");
      out.write("</body>\r\n");
      out.write("</html> \t");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
