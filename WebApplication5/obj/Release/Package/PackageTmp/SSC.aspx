<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Site.Master" CodeBehind="SSC.aspx.cs" Inherits="WebApplication5.SSC" %>
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
    <asp:SqlDataSource ID="HydrosLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Hydros')"></asp:SqlDataSource>
    <asp:SqlDataSource ID="LurkerLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Lurker')"></asp:SqlDataSource>
    <asp:SqlDataSource ID="LeotherasLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Leotheras')"></asp:SqlDataSource>
    <asp:SqlDataSource ID="KarathressLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Karathress')"></asp:SqlDataSource>
    <asp:SqlDataSource ID="TidewalkerLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Tidewalker')"></asp:SqlDataSource>
    <asp:SqlDataSource ID="VashjLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Vashj')"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SSCTrashLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Trash' AND RaidName = 'SSC')"></asp:SqlDataSource>
    <br /><br /><br /><br />

    <asp:Label ID="Label1" runat="server" Text="Label"><b>Select Date of SSC Raid</b></asp:Label>
    <asp:Calendar ID="calendarSSC" runat="server" OnSelectionChanged="calendarSSC_SelectionChanged"></asp:Calendar>
    <br /><asp:Label ID="labelRaidsRun" runat="server" Text="Label" CssClass="bold"></asp:Label>

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
    <h1>Hydross the Unstable</h1>
    <br />

    <p>Item&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Player</p>
    <ajaxToolkit:ComboBox ID="comboHydrosLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="HydrosLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>            
    <ajaxToolkit:ComboBox ID="comboHydrosPlayer1" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioHydros1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxHydros1" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboHydrosLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="HydrosLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboHydrosPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioHydros2" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxHydros2" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboHydrosLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="HydrosLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboHydrosPlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioHydros3" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxHydros3" CssClass="inlineBlock" runat="server" text="Sidegrade"/>

    <br />

    <br />
    <h1>The Lurker Below</h1>

    <ajaxToolkit:ComboBox ID="comboLurkerLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="LurkerLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>            
    <ajaxToolkit:ComboBox ID="comboLurkerPlayer1" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioLurker1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxLurker1" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboLurkerLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="LurkerLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboLurkerPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioLurker2" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxLurker2" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboLurkerLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="LurkerLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboLurkerPlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioLurker3" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxLurker3" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />

    <br />
    <h1>Leotheras the Blind</h1>

    <ajaxToolkit:ComboBox ID="comboLeotherasLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="LeotherasLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>            
    <ajaxToolkit:ComboBox ID="comboLeotherasPlayer1" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioLeotheras1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxLeotheras1" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboLeotherasLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="LeotherasLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboLeotherasPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioLeotheras2" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxLeotheras2" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboLeotherasLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="LeotherasLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboLeotherasPlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioLeotheras3" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxLeotheras3" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />

    <br />
    <h1>Fathom-Lord Karathress</h1>

    <ajaxToolkit:ComboBox ID="comboKarathressLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="KarathressLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>            
    <ajaxToolkit:ComboBox ID="comboKarathressPlayer1" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioKarathress1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxKarathress1" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboKarathressLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="KarathressLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboKarathressPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioKarathress2" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxKarathress2" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboKarathressLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="KarathressLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboKarathressPlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioKarathress3" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxKarathress3" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />

    <br /> <br />
    <h1>Morogrim Tidewalker</h1>

    <ajaxToolkit:ComboBox ID="comboTidewalkerLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="TidewalkerLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>            
    <ajaxToolkit:ComboBox ID="comboTidewalkerPlayer1" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioTidewalker1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTidewalker1" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboTidewalkerLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="TidewalkerLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboTidewalkerPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioTidewalker2" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTidewalker2" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboTidewalkerLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="TidewalkerLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboTidewalkerPlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioTidewalker3" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>  
    <asp:CheckBox ID="checkboxTidewalker3" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboTidewalkerLoot4" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="TidewalkerLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboTidewalkerPlayer4" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioTidewalker4" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList> 
    <asp:CheckBox ID="checkboxTidewalker4" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    
        <br /><br />
    <h1>Lady Vashj</h1>

    <ajaxToolkit:ComboBox ID="comboVashjLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="VashjLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>            
    <ajaxToolkit:ComboBox ID="comboVashjPlayer1" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioVashj1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxVashj1" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboVashjLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="VashjLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboVashjPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioVashj2" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxVashj2" CssClass="inlineBlock" runat="server" text="Sidegrade"/>
    <br />
    <ajaxToolkit:ComboBox ID="comboVashjLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="VashjLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboVashjPlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioVashj3" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
    <asp:ListItem Selected="True">Mainspec</asp:ListItem>
    <asp:ListItem>Offspec</asp:ListItem>
    <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList> 
    <asp:CheckBox ID="checkboxVashj3" CssClass="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />
    <ajaxToolkit:ComboBox ID="comboVashjLoot4" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="VashjLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboVashjPlayer4" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioVashj4" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>  
    <asp:CheckBox ID="checkboxVashj4" CssClass="inlineBlock" runat="server" text="Sidegrade"/>

        <br /><br />
    
            <br />              <br />  
    <h1>Trash</h1>

    <ajaxToolkit:ComboBox ID="comboTrashLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="SSCTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboTrashPlayer1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioTrash1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash1" CssClass="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />
    <ajaxToolkit:ComboBox ID="comboTrashLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="SSCTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboTrashPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioTrash2"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash2" CssClass="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />
    <ajaxToolkit:ComboBox ID="comboTrashLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="SSCTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboTrashPlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioTrash3"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash3" CssClass="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />
    <ajaxToolkit:ComboBox ID="comboTrashLoot4" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="SSCTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboTrashPlayer4" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioTrash4"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash4" CssClass="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />
    <ajaxToolkit:ComboBox ID="comboTrashLoot5" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="SSCTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboTrashPlayer5" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioTrash5"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash5" CssClass="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />
    <ajaxToolkit:ComboBox ID="comboTrashLoot6" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="SSCTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboTrashPlayer6" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioTrash6"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash6" CssClass="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />
    <ajaxToolkit:ComboBox ID="comboTrashLoot7" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="SSCTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboTrashPlayer7" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioTrash7"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash7" CssClass="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />
    <ajaxToolkit:ComboBox ID="comboTrashLoot8" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="SSCTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboTrashPlayer8" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioTrash8"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash8" CssClass="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />
    <ajaxToolkit:ComboBox ID="comboTrashLoot9" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="SSCTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboTrashPlayer9" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioTrash9"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash9" CssClass="inlineBlock" runat="server" text="Sidegrade"/> 
    <br />
    <ajaxToolkit:ComboBox ID="comboTrashLoot10" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="SSCTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboTrashPlayer10" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioTrash10"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
        <asp:ListItem Selected="True">Mainspec</asp:ListItem>
        <asp:ListItem>Offspec</asp:ListItem>
        <asp:ListItem>PvP</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash10" CssClass="inlineBlock" runat="server" text="Sidegrade"/> 
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