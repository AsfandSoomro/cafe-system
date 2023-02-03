<%@ taglib uri="/WEB-INF/lib/reports_tld.jar" prefix="rw" %>
<%@ page language="java" import="java.io.*" errorPage="/rwerror.jsp" session="false" %>
<!--
<rw:report id="report">
<rw:objects id="objects">
<?xml version="1.0" encoding="WINDOWS-1252" ?>
<report name="drink_sales" DTDVersion="9.0.2.0.10">
  <xmlSettings xmlTag="DRINK_SALES" xmlPrologType="text">
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
      <![CDATA[SELECT ALL DRINKS.DRINK_NAME, DRINK_TYPES.TYPE_NAME, 
DRINK_ORDERS.ORDER_ID, DRINK_ORDERS.ORDER_DATE, DRINK_ORDERS.TOTAL_AMOUNT, DRINK_ORDERS.DRINK_ID, DRINK_ORDERS.DRINK_QUANTITY
FROM DRINK_ORDERS, DRINK_TYPES, DRINKS
WHERE ((DRINK_ORDERS.DRINK_ID = DRINKS.DRINK_ID)
 AND (DRINKS.DRINK_TYPE_ID = DRINK_TYPES.TYPE_ID)) 
ORDER BY DRINK_ORDERS.ORDER_ID;]]>
      </select>
      <displayInfo x="1.65002" y="1.00000" width="0.69995" height="0.19995"/>
      <group name="G_ORDER_ID">
        <displayInfo x="1.23083" y="1.94995" width="1.53845" height="1.28516"
        />
        <dataItem name="ORDER_ID" oracleDatatype="number" columnOrder="13"
         width="22" defaultWidth="50000" defaultHeight="10000" columnFlags="1"
         defaultLabel="Order Id">
          <dataDescriptor expression="DRINK_ORDERS.ORDER_ID"
           descriptiveExpression="ORDER_ID" order="3" oracleDatatype="number"
           width="22" precision="38"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="TYPE_NAME" datatype="vchar2" columnOrder="12"
         width="20" defaultWidth="100000" defaultHeight="10000"
         columnFlags="1" defaultLabel="Drink Type">
          <dataDescriptor expression="DRINK_TYPES.TYPE_NAME"
           descriptiveExpression="TYPE_NAME" order="2" width="20"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="DRINK_NAME" datatype="vchar2" columnOrder="11"
         width="32" defaultWidth="100000" defaultHeight="10000"
         columnFlags="1" defaultLabel="Drink Name">
          <dataDescriptor expression="DRINKS.DRINK_NAME"
           descriptiveExpression="DRINK_NAME" order="1" width="32"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="DRINK_ID" oracleDatatype="number" columnOrder="16"
         width="22" defaultWidth="50000" defaultHeight="10000" columnFlags="1"
         defaultLabel="Drink Id">
          <dataDescriptor expression="DRINK_ORDERS.DRINK_ID"
           descriptiveExpression="DRINK_ID" order="6" oracleDatatype="number"
           width="22" precision="38"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="DRINK_QUANTITY" oracleDatatype="number"
         columnOrder="17" width="22" defaultWidth="90000"
         defaultHeight="10000" columnFlags="1" defaultLabel="Drink Quantity">
          <dataDescriptor expression="DRINK_ORDERS.DRINK_QUANTITY"
           descriptiveExpression="DRINK_QUANTITY" order="7"
           oracleDatatype="number" width="22" precision="38"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="TOTAL_AMOUNT" oracleDatatype="number" columnOrder="15"
         width="22" defaultWidth="120000" defaultHeight="10000"
         columnFlags="1" defaultLabel="Total Amount">
          <dataDescriptor expression="DRINK_ORDERS.TOTAL_AMOUNT"
           descriptiveExpression="TOTAL_AMOUNT" order="5"
           oracleDatatype="number" width="22" scale="2" precision="10"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="ORDER_DATE" datatype="date" oracleDatatype="date"
         columnOrder="14" width="9" defaultWidth="90000" defaultHeight="10000"
         columnFlags="1" defaultLabel="Order Date">
          <dataDescriptor expression="DRINK_ORDERS.ORDER_DATE"
           descriptiveExpression="ORDER_DATE" order="4" oracleDatatype="date"
           width="9"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
      </group>
    </dataSource>
    <summary name="CountORDER_IDPerReport" source="ORDER_ID" function="count"
     precision="8" reset="report" compute="report" defaultWidth="100000"
     defaultHeight="10000" columnFlags="552" defaultLabel="Total Drinks Sold:">
      <displayInfo x="0.00000" y="0.00000" width="0.79993" height="0.19995"/>
    </summary>
    <summary name="SumDRINK_QUANTITYPerReport" source="DRINK_QUANTITY"
     function="sum" width="22" precision="38" reset="report" compute="report"
     defaultWidth="90000" defaultHeight="10000" columnFlags="552"
     defaultLabel="Number of Drinks Sold:">
      <displayInfo x="0.79993" y="0.00000" width="0.79993" height="0.19995"/>
    </summary>
    <summary name="SumTOTAL_AMOUNTPerReport" source="TOTAL_AMOUNT"
     function="sum" width="22" precision="10" scale="2" reset="report"
     compute="report" defaultWidth="120000" defaultHeight="10000"
     columnFlags="552" defaultLabel="Revenue:">
      <displayInfo x="1.59985" y="0.00000" width="0.79993" height="0.19995"/>
    </summary>
  </data>
  <layout>
  <section name="main">
    <body>
      <frame name="M_G_ORDER_ID_GRPFR">
        <geometryInfo x="0.00000" y="0.68750" width="7.12500" height="1.27112"
        />
        <generalLayout verticalElasticity="variable"/>
        <visualSettings fillPattern="transparent"/>
        <repeatingFrame name="R_G_ORDER_ID" source="G_ORDER_ID"
         printDirection="down" minWidowRecords="1" columnMode="no"
         vertSpaceBetweenFrames="0.4375">
          <geometryInfo x="0.00000" y="0.87500" width="7.12500"
           height="0.18750"/>
          <generalLayout verticalElasticity="variable"/>
          <visualSettings fillPattern="transparent" fillBackgroundColor="gray"/>
          <field name="F_ORDER_ID" source="ORDER_ID" minWidowLines="1"
           spacing="0" alignment="center">
            <font face="helvetica" size="10" bold="yes"/>
            <geometryInfo x="0.00000" y="0.87500" width="0.62500"
             height="0.18750"/>
            <generalLayout verticalElasticity="variable"/>
            <visualSettings fillPattern="transparent"
             fillBackgroundColor="gray"/>
          </field>
          <field name="F_TYPE_NAME" source="TYPE_NAME" minWidowLines="1"
           spacing="0" alignment="center">
            <font face="helvetica" size="10" bold="yes"/>
            <geometryInfo x="0.62500" y="0.87500" width="1.00000"
             height="0.18750"/>
            <generalLayout verticalElasticity="variable"/>
            <visualSettings fillPattern="transparent"
             fillBackgroundColor="gray"/>
          </field>
          <field name="F_DRINK_NAME" source="DRINK_NAME" minWidowLines="1"
           spacing="0" alignment="center">
            <font face="helvetica" size="10" bold="yes"/>
            <geometryInfo x="1.62500" y="0.87500" width="1.18750"
             height="0.18750"/>
            <generalLayout verticalElasticity="variable"/>
            <visualSettings fillPattern="transparent"
             fillBackgroundColor="gray"/>
          </field>
          <field name="F_DRINK_ID" source="DRINK_ID" minWidowLines="1"
           spacing="0" alignment="center">
            <font face="helvetica" size="10" bold="yes"/>
            <geometryInfo x="2.87500" y="0.87500" width="0.56250"
             height="0.18750"/>
            <generalLayout verticalElasticity="variable"/>
            <visualSettings fillPattern="transparent"
             fillBackgroundColor="gray"/>
          </field>
          <field name="F_DRINK_QUANTITY" source="DRINK_QUANTITY"
           minWidowLines="1" spacing="0" alignment="center">
            <font face="helvetica" size="10" bold="yes"/>
            <geometryInfo x="3.68750" y="0.87500" width="0.81250"
             height="0.18750"/>
            <generalLayout verticalElasticity="variable"/>
            <visualSettings fillPattern="transparent"
             fillBackgroundColor="gray"/>
          </field>
          <field name="F_TOTAL_AMOUNT" source="TOTAL_AMOUNT" minWidowLines="1"
           formatMask="LNNNGNNNGNNNGNN0D00" spacing="0" alignment="center">
            <font face="helvetica" size="10" bold="yes"/>
            <geometryInfo x="4.56250" y="0.87500" width="1.37500"
             height="0.18750"/>
            <generalLayout verticalElasticity="variable"/>
            <visualSettings fillPattern="transparent"
             fillBackgroundColor="gray"/>
          </field>
          <field name="F_ORDER_DATE" source="ORDER_DATE" minWidowLines="1"
           spacing="0" alignment="center">
            <font face="helvetica" size="10" bold="yes"/>
            <geometryInfo x="6.00000" y="0.87500" width="1.12500"
             height="0.18750"/>
            <generalLayout verticalElasticity="variable"/>
            <visualSettings fillPattern="transparent"
             fillBackgroundColor="gray"/>
          </field>
        </repeatingFrame>
        <frame name="M_G_ORDER_ID_FTR">
          <geometryInfo x="0.00000" y="1.37500" width="7.12500"
           height="0.58362"/>
          <advancedLayout printObjectOnPage="lastPage"
           basePrintingOn="anchoringObject"/>
          <visualSettings fillPattern="transparent"
           fillBackgroundColor="r25g0b0"/>
          <field name="F_CountORDER_IDPerReport"
           source="CountORDER_IDPerReport" minWidowLines="1" spacing="0"
           alignment="center">
            <font face="helvetica" size="10" bold="yes" textColor="white"/>
            <geometryInfo x="0.00000" y="1.75000" width="0.62500"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
            <visualSettings fillPattern="transparent"
             fillBackgroundColor="r25g0b0"/>
          </field>
          <field name="F_SumDRINK_QUANTITYPerReport"
           source="SumDRINK_QUANTITYPerReport" minWidowLines="1" spacing="0"
           alignment="center">
            <font face="helvetica" size="10" bold="yes" textColor="white"/>
            <geometryInfo x="3.68750" y="1.37500" width="0.81250"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
            <visualSettings fillPattern="transparent"
             fillBackgroundColor="r25g0b0"/>
          </field>
          <field name="F_SumTOTAL_AMOUNTPerReport"
           source="SumTOTAL_AMOUNTPerReport" minWidowLines="1"
           formatMask="LNNNGNNNGNNNGNN0D00" spacing="0" alignment="center">
            <font face="helvetica" size="10" bold="yes" textColor="white"/>
            <geometryInfo x="4.56250" y="1.37500" width="1.37500"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
            <visualSettings fillPattern="transparent"
             fillBackgroundColor="r25g0b0"/>
          </field>
          <text name="B_Total_" minWidowLines="1">
            <textSettings spacing="0"/>
            <geometryInfo x="0.12500" y="1.37500" width="0.43750"
             height="0.18750"/>
            <visualSettings fillPattern="transparent"
             fillBackgroundColor="r25g0b0"/>
            <textSegment>
              <font face="helvetica" size="10" bold="yes" textColor="white"/>
              <string>
              <![CDATA[Total:]]>
              </string>
            </textSegment>
          </text>
        </frame>
        <frame name="M_G_ORDER_ID_HDR">
          <geometryInfo x="0.00000" y="0.68750" width="7.12500"
           height="0.18750"/>
          <advancedLayout printObjectOnPage="allPage"
           basePrintingOn="anchoringObject"/>
          <visualSettings fillPattern="transparent"
           fillBackgroundColor="r25g0b0"/>
          <text name="B_ORDER_ID" minWidowLines="1">
            <textSettings justify="center" spacing="0"/>
            <geometryInfo x="0.00000" y="0.68750" width="0.62500"
             height="0.18750"/>
            <visualSettings fillPattern="transparent"
             fillBackgroundColor="r25g0b0"/>
            <textSegment>
              <font face="helvetica" size="10" bold="yes" textColor="white"/>
              <string>
              <![CDATA[Order Id]]>
              </string>
            </textSegment>
          </text>
          <text name="B_TYPE_NAME" minWidowLines="1">
            <textSettings justify="center" spacing="0"/>
            <geometryInfo x="0.62500" y="0.68750" width="1.00000"
             height="0.18750"/>
            <visualSettings fillPattern="transparent"
             fillBackgroundColor="r25g0b0"/>
            <textSegment>
              <font face="helvetica" size="10" bold="yes" textColor="white"/>
              <string>
              <![CDATA[Drink Type]]>
              </string>
            </textSegment>
          </text>
          <text name="B_DRINK_NAME" minWidowLines="1">
            <textSettings justify="center" spacing="0"/>
            <geometryInfo x="1.62500" y="0.68750" width="1.18750"
             height="0.18750"/>
            <visualSettings fillPattern="transparent"
             fillBackgroundColor="r25g0b0"/>
            <textSegment>
              <font face="helvetica" size="10" bold="yes" textColor="white"/>
              <string>
              <![CDATA[Drink Name]]>
              </string>
            </textSegment>
          </text>
          <text name="B_DRINK_ID" minWidowLines="1">
            <textSettings justify="center" spacing="0"/>
            <geometryInfo x="2.87500" y="0.68750" width="0.56250"
             height="0.18750"/>
            <visualSettings fillPattern="transparent"
             fillBackgroundColor="r25g0b0"/>
            <textSegment>
              <font face="helvetica" size="10" bold="yes" textColor="white"/>
              <string>
              <![CDATA[Drink Id]]>
              </string>
            </textSegment>
          </text>
          <text name="B_DRINK_QUANTITY" minWidowLines="1">
            <textSettings justify="center" spacing="0"/>
            <geometryInfo x="3.68750" y="0.68750" width="0.81250"
             height="0.18750"/>
            <visualSettings fillPattern="transparent"
             fillBackgroundColor="r25g0b0"/>
            <textSegment>
              <font face="helvetica" size="10" bold="yes" textColor="white"/>
              <string>
              <![CDATA[Quantity]]>
              </string>
            </textSegment>
          </text>
          <text name="B_TOTAL_AMOUNT" minWidowLines="1">
            <textSettings justify="center" spacing="0"/>
            <geometryInfo x="4.56250" y="0.68750" width="1.37500"
             height="0.18750"/>
            <visualSettings fillPattern="transparent"
             fillBackgroundColor="r25g0b0"/>
            <textSegment>
              <font face="helvetica" size="10" bold="yes" textColor="white"/>
              <string>
              <![CDATA[Total Amount]]>
              </string>
            </textSegment>
          </text>
          <text name="B_ORDER_DATE" minWidowLines="1">
            <textSettings justify="center" spacing="0"/>
            <geometryInfo x="6.00000" y="0.68750" width="1.12500"
             height="0.18750"/>
            <visualSettings fillPattern="transparent"
             fillBackgroundColor="r25g0b0"/>
            <textSegment>
              <font face="helvetica" size="10" bold="yes" textColor="white"/>
              <string>
              <![CDATA[Order Date]]>
              </string>
            </textSegment>
          </text>
        </frame>
      </frame>
      <text name="B_2" minWidowLines="1">
        <textSettings spacing="single"/>
        <geometryInfo x="0.00000" y="0.06250" width="1.68750" height="0.34497"
        />
        <advancedLayout printObjectOnPage="allPage"
         basePrintingOn="anchoringObject"/>
        <visualSettings lineBackgroundColor="black"/>
        <textSegment>
          <font face="Times New Roman" size="20" bold="yes" underline="yes"
           textColor="r25g0b0"/>
          <string>
          <![CDATA[Drink Sales:]]>
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
  <rw:style id="rwgray105">
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
<rw:dataArea id="MGORDERIDGRPFR10">
<table class="OraTable">
<caption>  </caption>
 <!-- Header -->
 <thead>
  <tr>
   <th <rw:id id="HBORDERID10" asArray="no"/> class="OraColumnHeader"> Order Id </th>
   <th <rw:id id="HBTYPENAME10" asArray="no"/> class="OraColumnHeader"> Drink Type </th>
   <th <rw:id id="HBDRINKNAME10" asArray="no"/> class="OraColumnHeader"> Drink Name </th>
   <th <rw:id id="HBDRINKID10" asArray="no"/> class="OraColumnHeader"> Drink Id </th>
   <th <rw:id id="HBDRINKQUANTITY10" asArray="no"/> class="OraColumnHeader"> Drink Quantity </th>
   <th <rw:id id="HBTOTALAMOUNT10" asArray="no"/> class="OraColumnHeader"> Total Amount </th>
   <th <rw:id id="HBORDERDATE10" asArray="no"/> class="OraColumnHeader"> Order Date </th>
  </tr>
 </thead>
 <!-- Body -->
 <tbody>
  <rw:foreach id="RGORDERID101" src="G_ORDER_ID">
   <tr>
    <td <rw:headers id="HFORDERID10" src="HBORDERID10"/> class="OraCellNumber"><rw:field id="FORDERID10" src="ORDER_ID" nullValue="&nbsp;"> F_ORDER_ID </rw:field></td>
    <td <rw:headers id="HFTYPENAME10" src="HBTYPENAME10"/> class="OraCellText"><rw:field id="FTYPENAME10" src="TYPE_NAME" nullValue="&nbsp;"> F_TYPE_NAME </rw:field></td>
    <td <rw:headers id="HFDRINKNAME10" src="HBDRINKNAME10"/> class="OraCellText"><rw:field id="FDRINKNAME10" src="DRINK_NAME" nullValue="&nbsp;"> F_DRINK_NAME </rw:field></td>
    <td <rw:headers id="HFDRINKID10" src="HBDRINKID10"/> class="OraCellNumber"><rw:field id="FDRINKID10" src="DRINK_ID" nullValue="&nbsp;"> F_DRINK_ID </rw:field></td>
    <td <rw:headers id="HFDRINKQUANTITY10" src="HBDRINKQUANTITY10"/> class="OraCellNumber"><rw:field id="FDRINKQUANTITY10" src="DRINK_QUANTITY" nullValue="&nbsp;"> F_DRINK_QUANTITY </rw:field></td>
    <td <rw:headers id="HFTOTALAMOUNT10" src="HBTOTALAMOUNT10"/> class="OraCellNumber"><rw:field id="FTOTALAMOUNT10" src="TOTAL_AMOUNT" nullValue="&nbsp;"> F_TOTAL_AMOUNT </rw:field></td>
    <td <rw:headers id="HFORDERDATE10" src="HBORDERDATE10"/> class="OraCellText"><rw:field id="FORDERDATE10" src="ORDER_DATE" nullValue="&nbsp;"> F_ORDER_DATE </rw:field></td>
   </tr>
  </rw:foreach>
 </tbody>
 <!-- Report Level Summary -->
 <tr>
  <th class="OraTotalText"> &nbsp; </th>
  <th class="OraTotalText"> &nbsp; </th>
  <th class="OraTotalText"> &nbsp; </th>
  <th class="OraTotalText"> &nbsp; </th>
  <td <rw:headers id="HFSumDRINKQUANTITYPerReport10" src="HBDRINKQUANTITY10"/> class="OraTotalNumber">Number of Drinks Sold: <rw:field id="FSumDRINKQUANTITYPerReport10" src="SumDRINK_QUANTITYPerReport" nullValue="&nbsp;"> F_SumDRINK_QUANTITYPerReport </rw:field></td>
  <td <rw:headers id="HFSumTOTALAMOUNTPerReport10" src="HBTOTALAMOUNT10"/> class="OraTotalNumber">Revenue: <rw:field id="FSumTOTALAMOUNTPerReport10" src="SumTOTAL_AMOUNTPerReport" nullValue="&nbsp;"> F_SumTOTAL_AMOUNTPerReport </rw:field></td>
  <th class="OraTotalText"> &nbsp; </th>
 </tr>
 <tr>
  <td <rw:headers id="HFCountORDERIDPerReport10" src="HBORDERID10"/> class="OraTotalNumber">Total Drinks Sold: <rw:field id="FCountORDERIDPerReport10" src="CountORDER_IDPerReport" nullValue="&nbsp;"> F_CountORDER_IDPerReport </rw:field></td>
  <th class="OraTotalText"> &nbsp; </th>
  <th class="OraTotalText"> &nbsp; </th>
  <th class="OraTotalText"> &nbsp; </th>
  <th class="OraTotalText"> &nbsp; </th>
  <th class="OraTotalText"> &nbsp; </th>
  <th class="OraTotalText"> &nbsp; </th>
 </tr>
</table>
</rw:dataArea> <!-- id="MGORDERIDGRPFR10" -->
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
