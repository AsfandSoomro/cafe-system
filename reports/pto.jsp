<%@ taglib uri="/WEB-INF/lib/reports_tld.jar" prefix="rw" %> 
<%@ page language="java" import="java.io.*" errorPage="/rwerror.jsp" session="false" %>
<%@ page contentType="text/html;charset=ISO-8859-1" %>
<!--
<rw:report id="report"> 
<rw:objects id="objects">
<?xml version="1.0" encoding="WINDOWS-1252" ?>
<report name="pto" DTDVersion="9.0.2.0.10">
  <xmlSettings xmlTag="PTO" xmlPrologType="text">
  <![CDATA[<?xml version="1.0" encoding="&Encoding"?>]]>
  </xmlSettings>
  <reportHtmlEscapes>
    <beforeReportHtmlEscape>
    <![CDATA[<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html dir=&Direction>
<head>
<meta http-equiv="Content-Type"  content="text/html; charset=&Encoding">
</head>
<body bgcolor="#ffffff">

]]>
    </beforeReportHtmlEscape>
    <afterPageHtmlEscape>
    <![CDATA[<hr size=5 noshade>
]]>
    </afterPageHtmlEscape>
    <beforeFormHtmlEscape>
    <![CDATA[<html dir=&Direction>
<body bgcolor="#ffffff">
<form method=post action="_action_">
<input name="hidden_run_parameters" type=hidden value="_hidden_">
<font color=red><!--error--></font>
<center>
<p><table border=0 cellspacing=0 cellpadding=0>
<tr>
<td><input type=submit></td>
<td width=15>
<td><input type=reset></td>
</tr>
</table>
<p><hr><p>
]]>
    </beforeFormHtmlEscape>
    <pageNavigationHtmlEscape>
    <![CDATA[<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html dir=&Direction>
<head>
<meta http-equiv="Content-Type"  content="text/html; charset=&Encoding">
<TITLE>Oracle HTML Navigator</TITLE>
<SCRIPT type="text/javascript" LANGUAGE = "JavaScript">

var jump_index = 1			// Jump to this page
var num_pages = &TotalPages			// Total number of pages
var basefilename = "&file_name"		// Base file name
var fileext = "&file_ext"		//File extension

/* jumps to "new_page" */
function new_page(form, new_page)
{
	form.reqpage.value = new_page;
	parent.frames[0].location = basefilename + "_" + new_page + "."+fileext;
}

/* go back one page */
function back(form)
{
	/* if we are not in first page */
	if (jump_index > 1)
	{
		jump_index--;
		new_page(form, jump_index);
	}
}

/* go forward one page */
function forward(form)
{
	/* if we are not in last page */
	if (jump_index < num_pages)
	{
		jump_index++;
		new_page(form, jump_index);
	}
}

/* go to first page */
function first(form)
{
	if(jump_index != 1)
	{
		jump_index = 1;
		new_page(form, jump_index);
	}
}

/* go to last page */
function last(form)
{
	if(jump_index != num_pages)
	{
		jump_index = num_pages;
		new_page(form, jump_index);
	}
}

/* go to the user specified page number */
function pagenum(form)
{
	/* sanity check */
	if (form.reqpage.value < 1)
	{
		form.reqpage.value = 1;
	}
	if (form.reqpage.value > num_pages)
	{
		form.reqpage.value = num_pages;
	}
	jump_index = form.reqpage.value;
	new_page(form, jump_index);
}
</SCRIPT>
</HEAD>

<BODY>
<FORM NAME="ThisForm" action="" onSubmit="pagenum(this); return false;">
<center><table><tr>
<td> <INPUT TYPE="button"  VALUE="<< " onClick="first(this.form)">
<td> <INPUT TYPE="button"  VALUE=" < " onClick="back(this.form)">
<td> <INPUT TYPE="button"  VALUE="Page:" onClick="pagenum(this.form)">
<td> <INPUT NAME="reqpage" VALUE="1" SIZE=2>
<td> <INPUT TYPE="button"  VALUE=" > " onClick="forward(this.form)">
<td> <INPUT TYPE="button"  VALUE=" >>" onClick="last(this.form)">
</table></center>
</FORM>
</body></html>]]>
    </pageNavigationHtmlEscape>
  </reportHtmlEscapes>
  <data>
    <userParameter name="p_manager" datatype="character" width="64"
     precision="10" defaultWidth="0" defaultHeight="0"/>
    <dataSource name="Q_1">
      <select>
      <![CDATA[SELECT ALL USERS.USER_ID, USERS.USERNAME, USERS.FIRST_NAME, USERS.EMAIL, 
USERS.ADDRESS, USERS.STATUS, USERS.REGISTER_DATE, USERS.LAST_NAME
FROM USERS
WHERE USERS.STATUS = 'Employee';]]>
      </select>
      <displayInfo x="1.65002" y="1.00000" width="0.69995" height="0.19995"/>
      <group name="G_USER_ID">
        <displayInfo x="1.19421" y="1.94995" width="1.61169" height="1.45605"
        />
        <dataItem name="LAST_NAME" datatype="vchar2" columnOrder="19"
         width="20" defaultWidth="100000" defaultHeight="10000"
         columnFlags="1" defaultLabel="Last Name">
          <dataDescriptor expression="USERS.LAST_NAME"
           descriptiveExpression="LAST_NAME" order="8" width="20"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="USER_ID" oracleDatatype="number" columnOrder="12"
         width="22" defaultWidth="90000" defaultHeight="10000" columnFlags="1"
         defaultLabel="User Id">
          <dataDescriptor expression="USERS.USER_ID"
           descriptiveExpression="USER_ID" order="1" oracleDatatype="number"
           width="22" precision="38"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="USERNAME" datatype="vchar2" columnOrder="13"
         width="32" defaultWidth="100000" defaultHeight="10000"
         columnFlags="1" defaultLabel="Username">
          <dataDescriptor expression="USERS.USERNAME"
           descriptiveExpression="USERNAME" order="2" width="32"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="FIRST_NAME" datatype="vchar2" columnOrder="14"
         width="20" defaultWidth="100000" defaultHeight="10000"
         columnFlags="1" defaultLabel="First Name">
          <dataDescriptor expression="USERS.FIRST_NAME"
           descriptiveExpression="FIRST_NAME" order="3" width="20"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="EMAIL" datatype="vchar2" columnOrder="15" width="32"
         defaultWidth="100000" defaultHeight="10000" columnFlags="1"
         defaultLabel="Email">
          <dataDescriptor expression="USERS.EMAIL"
           descriptiveExpression="EMAIL" order="4" width="32"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="ADDRESS" datatype="vchar2" columnOrder="16"
         width="128" defaultWidth="100000" defaultHeight="10000"
         columnFlags="1" defaultLabel="Address">
          <dataDescriptor expression="USERS.ADDRESS"
           descriptiveExpression="ADDRESS" order="5" width="128"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="STATUS" datatype="vchar2" columnOrder="17" width="20"
         defaultWidth="100000" defaultHeight="10000" columnFlags="1"
         defaultLabel="Status">
          <dataDescriptor expression="USERS.STATUS"
           descriptiveExpression="STATUS" order="6" width="20"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="REGISTER_DATE" datatype="date" oracleDatatype="date"
         columnOrder="18" width="9" defaultWidth="90000" defaultHeight="10000"
         columnFlags="1" defaultLabel="Register Date">
          <dataDescriptor expression="USERS.REGISTER_DATE"
           descriptiveExpression="REGISTER_DATE" order="7"
           oracleDatatype="date" width="9"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
      </group>
    </dataSource>
  </data>
  <layout>
  <section name="main">
    <body>
      <repeatingFrame name="R_G_USER_ID" source="G_USER_ID"
       printDirection="down" maxRecordsPerPage="1" minWidowRecords="1"
       columnMode="no">
        <geometryInfo x="0.00000" y="0.56250" width="7.50000" height="2.75000"
        />
        <generalLayout verticalElasticity="variable"/>
        <visualSettings fillPattern="transparent"
         fillBackgroundColor="TableCell"/>
        <text name="B_tbp" minWidowLines="1">
          <textSettings spacing="0"/>
          <geometryInfo x="0.00000" y="0.56250" width="7.50000"
           height="2.75000"/>
          <visualSettings fillPattern="transparent" fillBackgroundColor="gray"/>
          <textSegment>
            <font face="helvetica" size="10" bold="yes"/>
            <string>
            <![CDATA[Dear &<FIRST_NAME> &<LAST_NAME>,
]]>
            </string>
          </textSegment>
          <textSegment>
            <font face="helvetica" size="10" bold="yes"/>
            <string>
            <![CDATA[
]]>
            </string>
          </textSegment>
          <textSegment>
            <font face="helvetica" size="10" bold="yes"/>
            <string>
            <![CDATA[We are writing to inform you that you are being given some Paid Time Off (PTO). A month has been reserved for your time away from work.
]]>
            </string>
          </textSegment>
          <textSegment>
            <font face="helvetica" size="10" bold="yes"/>
            <string>
            <![CDATA[
]]>
            </string>
          </textSegment>
          <textSegment>
            <font face="helvetica" size="10" bold="yes"/>
            <string>
            <![CDATA[We understand that taking time off can be difficult, but it is important for our employees to have time to recharge and take care of personal matters. We are committed to providing our employees with the support they need to maintain a healthy work-life balance.
]]>
            </string>
          </textSegment>
          <textSegment>
            <font face="helvetica" size="10" bold="yes"/>
            <string>
            <![CDATA[
]]>
            </string>
          </textSegment>
          <textSegment>
            <font face="helvetica" size="10" bold="yes"/>
            <string>
            <![CDATA[We appreciate your contributions to the company and look forward to your return. If you have any questions or concerns, please do not hesitate to reach out to your manager.
]]>
            </string>
          </textSegment>
          <textSegment>
            <font face="helvetica" size="10" bold="yes"/>
            <string>
            <![CDATA[
]]>
            </string>
          </textSegment>
          <textSegment>
            <font face="helvetica" size="10" bold="yes"/>
            <string>
            <![CDATA[Thank you for your hard work and dedication.
]]>
            </string>
          </textSegment>
          <textSegment>
            <font face="helvetica" size="10" bold="yes"/>
            <string>
            <![CDATA[
]]>
            </string>
          </textSegment>
          <textSegment>
            <font face="helvetica" size="10" bold="yes"/>
            <string>
            <![CDATA[Sincerely,
]]>
            </string>
          </textSegment>
          <textSegment>
            <font face="helvetica" size="10" bold="yes"/>
            <string>
            <![CDATA[&<P_MANAGER>]]>
            </string>
          </textSegment>
        </text>
      </repeatingFrame>
      <text name="B_2" minWidowLines="1">
        <textSettings justify="center" spacing="0"/>
        <geometryInfo x="1.43750" y="0.18750" width="4.43750" height="0.31250"
        />
        <advancedLayout printObjectOnPage="allPage"
         basePrintingOn="anchoringObject"/>
        <visualSettings fillPattern="transparent"/>
        <textSegment>
          <font face="Courier New" size="18" bold="yes" underline="yes"
           textColor="r25g0b0"/>
          <string>
          <![CDATA[Paid Time Off (PTO) Letter]]>
          </string>
        </textSegment>
      </text>
    </body>
    <margin>
      <text name="B_1" minWidowLines="1">
        <textSettings justify="center" spacing="single"/>
        <geometryInfo x="0.50000" y="0.37500" width="7.50000" height="0.37500"
        />
        <advancedLayout printObjectOnPage="allPage"
         basePrintingOn="anchoringObject"/>
        <visualSettings fillPattern="transparent"
         fillBackgroundColor="r25g0b0"/>
        <textSegment>
          <font face="Courier New" size="22" bold="yes" textColor="white"/>
          <string>
          <![CDATA[Asfand's Cafe]]>
          </string>
        </textSegment>
      </text>
    </margin>
  </section>
  </layout>
  <colorPalette>
    <color index="190" displayName="TextColor" value="#ff0000"/>
    <color index="191" displayName="TableHeading" value="#999999"/>
    <color index="192" displayName="TableCell" value="#eaeaea"/>
    <color index="193" displayName="Totals" value="#d6d6d6"/>
  </colorPalette>
  <reportPrivate versionFlags2="0" templateName="rwgray"/>
  <reportWebSettings>
  <![CDATA[]]>
  </reportWebSettings>
</report>
</rw:objects>
-->

<html>

<head>
<meta name="GENERATOR" content="Oracle 9i Reports Developer"/>
<title> Your Title </title>

<rw:style id="yourStyle">
   <!-- Report Wizard inserts style link clause here -->
</rw:style>

</head>


<body>

<rw:dataArea id="yourDataArea">
   <!-- Report Wizard inserts the default jsp here -->
</rw:dataArea>



</body>
</html>

<!--
</rw:report> 
-->
