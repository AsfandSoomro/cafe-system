<%@ taglib uri="/WEB-INF/lib/reports_tld.jar" prefix="rw" %>
<%@ page language="java" import="java.io.*" errorPage="/rwerror.jsp" session="false" %>
<!--
<rw:report id="report">
<rw:objects id="objects">
<?xml version="1.0" encoding="WINDOWS-1252" ?>
<report name="staff" DTDVersion="9.0.2.0.10">
  <xmlSettings xmlTag="STAFF" xmlPrologType="text">
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
    <dataSource name="Q_1">
      <select>
      <![CDATA[SELECT ALL USERS.USER_ID, USERS.USERNAME, USERS.FIRST_NAME, 
USERS.LAST_NAME, USERS.ADDRESS, USERS.STATUS, USERS.REGISTER_DATE
FROM USERS
WHERE USERS.STATUS != 'Customer'
ORDER BY USERS.USER_ID;]]>
      </select>
      <displayInfo x="1.65002" y="1.00000" width="0.69995" height="0.19995"/>
      <group name="G_ORDER_ID">
        <displayInfo x="1.23083" y="1.94995" width="1.53845" height="1.28516"
        />
        <dataItem name="USER_ID" oracleDatatype="number" columnOrder="11"
         width="22" defaultWidth="90000" defaultHeight="10000" columnFlags="1"
         defaultLabel="User Id">
          <dataDescriptor expression="USERS.USER_ID"
           descriptiveExpression="USER_ID" order="1" oracleDatatype="number"
           width="22" precision="38"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="USERNAME" datatype="vchar2" columnOrder="12"
         width="32" defaultWidth="100000" defaultHeight="10000"
         columnFlags="1" defaultLabel="Username">
          <dataDescriptor expression="USERS.USERNAME"
           descriptiveExpression="USERNAME" order="2" width="32"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="FIRST_NAME" datatype="vchar2" columnOrder="13"
         width="20" defaultWidth="100000" defaultHeight="10000"
         columnFlags="1" defaultLabel="First Name">
          <dataDescriptor expression="USERS.FIRST_NAME"
           descriptiveExpression="FIRST_NAME" order="3" width="20"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="LAST_NAME" datatype="vchar2" columnOrder="14"
         width="20" defaultWidth="100000" defaultHeight="10000"
         columnFlags="1" defaultLabel="Last Name">
          <dataDescriptor expression="USERS.LAST_NAME"
           descriptiveExpression="LAST_NAME" order="4" width="20"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="ADDRESS" datatype="vchar2" columnOrder="15"
         width="128" defaultWidth="100000" defaultHeight="10000"
         columnFlags="1" defaultLabel="Address">
          <dataDescriptor expression="USERS.ADDRESS"
           descriptiveExpression="ADDRESS" order="5" width="128"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="STATUS" datatype="vchar2" columnOrder="16" width="20"
         defaultWidth="100000" defaultHeight="10000" columnFlags="1"
         defaultLabel="Status">
          <dataDescriptor expression="USERS.STATUS"
           descriptiveExpression="STATUS" order="6" width="20"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="REGISTER_DATE" datatype="date" oracleDatatype="date"
         columnOrder="17" width="9" defaultWidth="90000" defaultHeight="10000"
         columnFlags="1" defaultLabel="Register Date">
          <dataDescriptor expression="USERS.REGISTER_DATE"
           descriptiveExpression="REGISTER_DATE" order="7"
           oracleDatatype="date" width="9"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
      </group>
    </dataSource>
    <summary name="CountUSER_IDPerReport" source="USER_ID" function="count"
     precision="8" reset="report" compute="report" defaultWidth="100000"
     defaultHeight="10000" columnFlags="552" defaultLabel="Total">
      <displayInfo x="0.00000" y="0.00000" width="0.79993" height="0.19995"/>
    </summary>
  </data>
  <layout>
  <section name="main">
    <body>
      <frame name="M_G_ORDER_ID_GRPFR">
        <geometryInfo x="0.00000" y="0.75000" width="7.25000" height="1.00000"
        />
        <generalLayout verticalElasticity="variable"/>
        <visualSettings fillPattern="transparent"/>
        <repeatingFrame name="R_G_ORDER_ID" source="G_ORDER_ID"
         printDirection="down" minWidowRecords="1" columnMode="no"
         vertSpaceBetweenFrames="0.2500">
          <geometryInfo x="0.00000" y="0.93750" width="7.25000"
           height="0.25000"/>
          <generalLayout verticalElasticity="expand"/>
          <visualSettings fillPattern="transparent" fillBackgroundColor="gray"/>
          <field name="F_USER_ID" source="USER_ID" minWidowLines="1"
           spacing="0" alignment="center">
            <font face="helvetica" size="10"/>
            <geometryInfo x="0.00000" y="0.93750" width="0.50000"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
          <field name="F_USERNAME" source="USERNAME" minWidowLines="1"
           spacing="0" alignment="center">
            <font face="helvetica" size="10" bold="yes"/>
            <geometryInfo x="0.50000" y="0.93750" width="1.18750"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
          <field name="F_FIRST_NAME" source="FIRST_NAME" minWidowLines="1"
           spacing="0" alignment="center">
            <font face="helvetica" size="10" bold="yes"/>
            <geometryInfo x="1.68750" y="0.93750" width="0.93750"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
          <field name="F_LAST_NAME" source="LAST_NAME" minWidowLines="1"
           spacing="0" alignment="center">
            <font face="helvetica" size="10" bold="yes"/>
            <geometryInfo x="2.62500" y="0.93750" width="1.06250"
             height="0.25000"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
          <field name="F_ADDRESS" source="ADDRESS" minWidowLines="1"
           spacing="0" alignment="center">
            <font face="helvetica" size="10" bold="yes"/>
            <geometryInfo x="3.68750" y="0.93750" width="1.31250"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
          <field name="F_STATUS" source="STATUS" minWidowLines="1" spacing="0"
           alignment="center">
            <font face="helvetica" size="10" bold="yes"/>
            <geometryInfo x="5.00000" y="0.93750" width="0.87500"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
          <field name="F_REGISTER_DATE" source="REGISTER_DATE"
           minWidowLines="1" spacing="0" alignment="center">
            <font face="helvetica" size="10" bold="yes"/>
            <geometryInfo x="5.87500" y="0.93750" width="1.37500"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
        </repeatingFrame>
        <frame name="M_G_ORDER_ID_FTR">
          <geometryInfo x="0.00000" y="1.37500" width="7.25000"
           height="0.37500"/>
          <advancedLayout printObjectOnPage="lastPage"
           basePrintingOn="anchoringObject"/>
          <visualSettings fillPattern="transparent"
           fillBackgroundColor="r25g0b0"/>
          <field name="F_CountUSER_IDPerReport" source="CountUSER_IDPerReport"
           minWidowLines="1" spacing="0" alignment="center">
            <font face="helvetica" size="10" bold="yes" textColor="white"/>
            <geometryInfo x="0.00000" y="1.37500" width="0.50000"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
        </frame>
        <frame name="M_G_ORDER_ID_HDR">
          <geometryInfo x="0.00000" y="0.75000" width="7.25000"
           height="0.18750"/>
          <advancedLayout printObjectOnPage="allPage"
           basePrintingOn="anchoringObject"/>
          <visualSettings fillPattern="transparent"
           fillBackgroundColor="TableHeading"/>
          <text name="B_USER_ID" minWidowLines="1">
            <textSettings justify="center" spacing="0"/>
            <geometryInfo x="0.00000" y="0.75000" width="0.50000"
             height="0.18750"/>
            <visualSettings fillPattern="transparent"
             fillBackgroundColor="r25g0b0"/>
            <textSegment>
              <font face="helvetica" size="10" bold="yes" textColor="white"/>
              <string>
              <![CDATA[ID]]>
              </string>
            </textSegment>
          </text>
          <text name="B_USERNAME" minWidowLines="1">
            <textSettings justify="center" spacing="0"/>
            <geometryInfo x="0.50000" y="0.75000" width="1.18750"
             height="0.18750"/>
            <visualSettings fillPattern="transparent"
             fillBackgroundColor="r25g0b0"/>
            <textSegment>
              <font face="helvetica" size="10" bold="yes" textColor="white"/>
              <string>
              <![CDATA[Username]]>
              </string>
            </textSegment>
          </text>
          <text name="B_FIRST_NAME" minWidowLines="1">
            <textSettings justify="center" spacing="0"/>
            <geometryInfo x="1.68750" y="0.75000" width="0.93750"
             height="0.18750"/>
            <visualSettings fillPattern="transparent"
             fillBackgroundColor="r25g0b0"/>
            <textSegment>
              <font face="helvetica" size="10" bold="yes" textColor="white"/>
              <string>
              <![CDATA[First Name]]>
              </string>
            </textSegment>
          </text>
          <text name="B_LAST_NAME" minWidowLines="1">
            <textSettings justify="center" spacing="0"/>
            <geometryInfo x="2.62500" y="0.75000" width="1.06250"
             height="0.18750"/>
            <visualSettings fillPattern="transparent"
             fillBackgroundColor="r25g0b0"/>
            <textSegment>
              <font face="helvetica" size="10" bold="yes" textColor="white"/>
              <string>
              <![CDATA[Last Name]]>
              </string>
            </textSegment>
          </text>
          <text name="B_ADDRESS" minWidowLines="1">
            <textSettings justify="center" spacing="0"/>
            <geometryInfo x="3.68750" y="0.75000" width="1.31250"
             height="0.18750"/>
            <visualSettings fillPattern="transparent"
             fillBackgroundColor="r25g0b0"/>
            <textSegment>
              <font face="helvetica" size="10" bold="yes" textColor="white"/>
              <string>
              <![CDATA[Address]]>
              </string>
            </textSegment>
          </text>
          <text name="B_STATUS" minWidowLines="1">
            <textSettings justify="center" spacing="0"/>
            <geometryInfo x="5.00000" y="0.75000" width="0.87500"
             height="0.18750"/>
            <visualSettings fillPattern="transparent"
             fillBackgroundColor="r25g0b0"/>
            <textSegment>
              <font face="helvetica" size="10" bold="yes" textColor="white"/>
              <string>
              <![CDATA[Status]]>
              </string>
            </textSegment>
          </text>
          <text name="B_REGISTER_DATE" minWidowLines="1">
            <textSettings justify="center" spacing="0"/>
            <geometryInfo x="5.87500" y="0.75000" width="1.37500"
             height="0.18750"/>
            <visualSettings fillPattern="transparent"
             fillBackgroundColor="r25g0b0"/>
            <textSegment>
              <font face="helvetica" size="10" bold="yes" textColor="white"/>
              <string>
              <![CDATA[Register Date]]>
              </string>
            </textSegment>
          </text>
        </frame>
      </frame>
      <text name="B_2" minWidowLines="1">
        <textSettings spacing="single"/>
        <geometryInfo x="0.00000" y="0.26038" width="0.87500" height="0.30212"
        />
        <advancedLayout printObjectOnPage="allPage"
         basePrintingOn="anchoringObject"/>
        <visualSettings fillPattern="transparent" lineBackgroundColor="black"/>
        <textSegment>
          <font face="Courier New" size="18" bold="yes" underline="yes"
           textColor="r25g0b0"/>
          <string>
          <![CDATA[Staff]]>
          </string>
        </textSegment>
      </text>
    </body>
    <margin>
      <text name="B_1" minWidowLines="1">
        <textSettings justify="center" spacing="single"/>
        <geometryInfo x="0.50000" y="0.18750" width="7.12500" height="0.37500"
        />
        <advancedLayout printObjectOnPage="allPage"
         basePrintingOn="anchoringObject"/>
        <visualSettings fillPattern="transparent"
         fillBackgroundColor="r25g0b0" lineBackgroundColor="black"/>
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
  <reportPrivate defaultReportType="tabular" versionFlags2="0"
   templateName="rwgray"/>
  <reportWebSettings>
  <![CDATA[]]>
  </reportWebSettings>
</report>
</rw:objects>
-->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<HTML>

<HEAD>
  <TITLE> Your Title </TITLE>
  <rw:style id="rwgray64">
<link rel="StyleSheet" type="text/css" href="css/rwgray.css">
</rw:style>

  <META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</HEAD>

<BODY bgColor="#ffffff" link="#000000" vLink="#000000">

<TABLE border=0 cellPadding=0 cellSpacing=0 width="100%">
  <TBODY>
  <TR>
    <TD bgColor="#ffffff" rowSpan=2 vAlign=middle width=188><IMG alt="" src="images/rwgray_logo.gif" width="135" height="36"></TD>
    <TD bgColor="#ffffff" height=40 vAlign=top><IMG alt="" height=1 src="images/stretch.gif" width=5></TD>
    <TD align=right bgColor="#ffffff" vAlign=bottom>&nbsp;</TD>
  </TR>
  </TBODY>
</TABLE>

<TABLE bgColor="#ff0000" border=0 cellPadding=0 cellSpacing=0 width="100%">
  <TBODY>
  <TR>
    <TD bgColor="#ff0000" class="OraColumnHeader">&nbsp;</TD>
  </TR>
  </TBODY>
</TABLE>

<TABLE border=0 cellPadding=0 cellSpacing=0 width="100%">
  <TBODY>
  <TR>
    <TD bgColor="#ff0000" vAlign=top class="OraColumnHeader"><IMG alt="" border=0 height=17 src="images/topcurl.gif" width=30></TD>
    <TD vAlign=top width="100%">
      <TABLE border=0 cellPadding=0 cellSpacing=0 width="100%">
        <TBODY>
        <TR>
          <TD bgColor="#000000" height=1><IMG alt="" border=0 height=1 src="images/stretch.gif" width=1></TD>
        </TR>
        <TR>
          <TD bgColor="#9a9c9a" height=1><IMG alt="" border=0 height=1 src="images/stretch.gif" width=1></TD>
        </TR>
        <TR>
          <TD bgColor="#b3b4b3" height=1><IMG alt="" border=0 height=1 src="images/stretch.gif" width=1></TD>
        </TR>
        </TBODY>
      </TABLE>
    </TD>
  </TR>
  </TBODY>
</TABLE>

<TABLE width="100%" border="0" cellspacing="0" cellpadding="0">
  <TR>
    <TD width="29%" valign="top">
      <TABLE width="77%" border="0" cellspacing="0" cellpadding="0">
        <TR>
          <TD width="10%" class="OraCellText"><IMG alt="" src="images/red_d_arrow.gif" width="10" height="10"></TD>
          <TD width="90%" class="OraCellText">Navigation goes here </TD>
        </TR>
        <TR>
          <TD width="10%" class="OraCellText"><IMG alt="" src="images/red_r_arrow.gif" width="10" height="10"></TD>
          <TD width="90%" class="OraCellText">Navigation Item</TD>
        </TR>
      </TABLE>
    </TD>
    <TD width="71%">
      <DIV align="center">
      <!-- Data Area Generated by Reports Developer -->
<rw:dataArea id="MGORDERIDGRPFR55">
<table class="OraTable">
<caption>  </caption>
 <!-- Header -->
 <thead>
  <tr>
   <th <rw:id id="HBUSERID55" asArray="no"/> class="OraColumnHeader"> User Id </th>
   <th <rw:id id="HBUSERNAME55" asArray="no"/> class="OraColumnHeader"> Username </th>
   <th <rw:id id="HBFIRSTNAME55" asArray="no"/> class="OraColumnHeader"> First Name </th>
   <th <rw:id id="HBLASTNAME55" asArray="no"/> class="OraColumnHeader"> Last Name </th>
   <th <rw:id id="HBADDRESS55" asArray="no"/> class="OraColumnHeader"> Address </th>
   <th <rw:id id="HBSTATUS55" asArray="no"/> class="OraColumnHeader"> Status </th>
   <th <rw:id id="HBREGISTERDATE55" asArray="no"/> class="OraColumnHeader"> Register Date </th>
  </tr>
 </thead>
 <!-- Body -->
 <tbody>
  <rw:foreach id="RGORDERID551" src="G_ORDER_ID">
   <tr>
    <td <rw:headers id="HFUSERID55" src="HBUSERID55"/> class="OraCellNumber"><rw:field id="FUSERID55" src="USER_ID" nullValue="&nbsp;"> F_USER_ID </rw:field></td>
    <td <rw:headers id="HFUSERNAME55" src="HBUSERNAME55"/> class="OraCellText"><rw:field id="FUSERNAME55" src="USERNAME" nullValue="&nbsp;"> F_USERNAME </rw:field></td>
    <td <rw:headers id="HFFIRSTNAME55" src="HBFIRSTNAME55"/> class="OraCellText"><rw:field id="FFIRSTNAME55" src="FIRST_NAME" nullValue="&nbsp;"> F_FIRST_NAME </rw:field></td>
    <td <rw:headers id="HFLASTNAME55" src="HBLASTNAME55"/> class="OraCellText"><rw:field id="FLASTNAME55" src="LAST_NAME" nullValue="&nbsp;"> F_LAST_NAME </rw:field></td>
    <td <rw:headers id="HFADDRESS55" src="HBADDRESS55"/> class="OraCellText"><rw:field id="FADDRESS55" src="ADDRESS" nullValue="&nbsp;"> F_ADDRESS </rw:field></td>
    <td <rw:headers id="HFSTATUS55" src="HBSTATUS55"/> class="OraCellText"><rw:field id="FSTATUS55" src="STATUS" nullValue="&nbsp;"> F_STATUS </rw:field></td>
    <td <rw:headers id="HFREGISTERDATE55" src="HBREGISTERDATE55"/> class="OraCellText"><rw:field id="FREGISTERDATE55" src="REGISTER_DATE" nullValue="&nbsp;"> F_REGISTER_DATE </rw:field></td>
   </tr>
  </rw:foreach>
 </tbody>
 <!-- Report Level Summary -->
 <tr>
  <td <rw:headers id="HFCountUSERIDPerReport55" src="HBUSERID55"/> class="OraTotalNumber">Total <rw:field id="FCountUSERIDPerReport55" src="CountUSER_IDPerReport" nullValue="&nbsp;"> F_CountUSER_IDPerReport </rw:field></td>
  <th class="OraTotalText"> &nbsp; </th>
  <th class="OraTotalText"> &nbsp; </th>
  <th class="OraTotalText"> &nbsp; </th>
  <th class="OraTotalText"> &nbsp; </th>
  <th class="OraTotalText"> &nbsp; </th>
  <th class="OraTotalText"> &nbsp; </th>
 </tr>
</table>
</rw:dataArea> <!-- id="MGORDERIDGRPFR55" -->
<!-- End of Data Area Generated by Reports Developer -->

      </DIV>
    </TD>
  </TR>
</TABLE>

<P>
  <BR>
</P>

<TABLE border=0 cellPadding=0 cellSpacing=0 width="100%">
  <TBODY>
  <TR>
    <TD bgColor="#000000" colSpan=2><IMG alt="" border=0 height=1 src="images/stretch.gif" width=1></TD>
  </TR>
  <TR>
    <TD bgColor="#ff0000" colSpan=2 class="OraColumnHeader"><IMG alt="" border=0 height=4 src="images/stretch.gif" width=1></TD>
  </TR>
  <TR>
    <TD bgColor="#000000" colSpan=2><IMG alt="" border=0 height=1 src="images/stretch.gif" width=1></TD>
  </TR>
  <TR>
    <TD bgColor="#ffffff">&nbsp;</TD>
    <TD align=right bgColor="#ffffff">&nbsp;</TD>
  </TR>
  </TBODY>
</TABLE>

</BODY>

</HTML>

<!--
</rw:report>
-->
