<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Mag.aspx.cs" Inherits="WebApplication5.Mag" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>




<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <script>var whTooltips = { colorLinks: true, iconizeLinks: true, renameLinks: true };</script>
    <script src="http://wow.zamimg.com/widgets/power.js"></script>
<%--    <a href="https://classic.wowhead.com/item=22589&amp;lvl=80" class="q5">Atiesh, Greatstaff of the Guardian</a> <small>(Level 80 conversions)</small><br />--%>

    
     <style type="text/css">
        .inlineBlock { display: inline-block; }

        
        .bold
        {
          font-weight:bold;
        }
    </style>

    <asp:SqlDataSource ID="Roster" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT PlayerName FROM Roster WHERE IsActive = 1"></asp:SqlDataSource>
    <asp:SqlDataSource ID="MagLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Mag')"></asp:SqlDataSource>

    <br /><br /><br /><br />
    <asp:Label ID="Label1" runat="server" Text="Label"><b>Select Date of Mag Raid</b></asp:Label>
    <asp:Calendar ID="calendarMag" runat="server" OnSelectionChanged="calendarMag_SelectionChanged"></asp:Calendar><br />
    <br /><asp:Label ID="labelRaidsRun" runat="server" Text="Label" CssClass="bold"></asp:Label><br /><br />

    <a href="https://tbc.wowhead.com/item=34845/pit-lords-satchel"></a><br />
    <asp:Label ID="labelHasMagBag" runat="server"></asp:Label>


    <div>
   <h4>Select a file to upload:</h4>

   <asp:FileUpload id="FileUpload1"                 
       runat="server">
   </asp:FileUpload>

   <br /><br />

   <asp:Button id="UploadButton" 
       Text="Upload file"
       OnClick="UploadButton_Click"
       runat="server">
   </asp:Button>    

   <hr />

   <asp:Label id="UploadStatusLabel"
       runat="server">
   </asp:Label>        
</div>

    <br />
    <h1>Magtheridon</h1>
    <br />
    <p>Item&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Player</p>

    <ajaxToolkit:ComboBox ID="comboMagLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="MagLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>            
    <ajaxToolkit:ComboBox ID="comboMagPlayer1" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioMag1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
	    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
	    <asp:ListItem>Offspec</asp:ListItem>
	    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxMag1" CssClass="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />

    <ajaxToolkit:ComboBox ID="comboMagLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="MagLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>            
    <ajaxToolkit:ComboBox ID="comboMagPlayer2" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioMag2"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
	    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
	    <asp:ListItem>Offspec</asp:ListItem>
	    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxMag2" CssClass="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />

    <ajaxToolkit:ComboBox ID="comboMagLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="MagLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>            
    <ajaxToolkit:ComboBox ID="comboMagPlayer3" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioMag3"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
	    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
	    <asp:ListItem>Offspec</asp:ListItem>
	    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxMag3" CssClass="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />

    <ajaxToolkit:ComboBox ID="comboMagLoot4" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="MagLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>            
    <ajaxToolkit:ComboBox ID="comboMagPlayer4" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioMag4"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
	    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
	    <asp:ListItem>Offspec</asp:ListItem>
	    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxMag4" CssClass="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />

    <ajaxToolkit:ComboBox ID="comboMagLoot5" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="MagLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>            
    <ajaxToolkit:ComboBox ID="comboMagPlayer5" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioMag5"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
	    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
	    <asp:ListItem>Offspec</asp:ListItem>
	    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxMag5" CssClass="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />

    <ajaxToolkit:ComboBox ID="comboMagLoot6" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="MagLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>            
    <ajaxToolkit:ComboBox ID="comboMagPlayer6" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioMag6"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
	    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
	    <asp:ListItem>Offspec</asp:ListItem>
	    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxMag6" CssClass="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />

    <br />
    <asp:Button ID="WriteToDatabase" runat="server" Text="Write to Database" onClientClick="return confirm('Really write to database?')" OnClick="WriteToDatabase_Click" />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />

    </asp:Content>