<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Karazhan.aspx.cs" Inherits="WebApplication5.WebForm1" %>

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
    
<%--            <asp:CheckBoxList ID="CheckBoxList1" runat="server" Width="380px" RepeatDirection="Horizontal">
                <asp:ListItem>MC</asp:ListItem>
                <asp:ListItem>Ony</asp:ListItem>
                <asp:ListItem>BWL</asp:ListItem>
                <asp:ListItem>AQ40</asp:ListItem>
                <asp:ListItem>Naxx</asp:ListItem>
            </asp:CheckBoxList>--%>

            <asp:SqlDataSource ID="Roster" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT PlayerName FROM Roster WHERE IsActive = 1"></asp:SqlDataSource>
            <asp:SqlDataSource ID="AttumenLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Attumen')"></asp:SqlDataSource>
            <asp:SqlDataSource ID="MoroesLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Moroes')"></asp:SqlDataSource>
            <asp:SqlDataSource ID="MaidenLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Maiden')"></asp:SqlDataSource>
            <asp:SqlDataSource ID="OperaLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Opera')"></asp:SqlDataSource>
            <asp:SqlDataSource ID="CuratorLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Curator')"></asp:SqlDataSource>
            <asp:SqlDataSource ID="IllhoofLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Illhoof')"></asp:SqlDataSource>
            <asp:SqlDataSource ID="AranLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Aran')"></asp:SqlDataSource>
            <asp:SqlDataSource ID="NetherspiteLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Netherspite')"></asp:SqlDataSource>
            <asp:SqlDataSource ID="ChessLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Chess')"></asp:SqlDataSource>
            <asp:SqlDataSource ID="NightbaneLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Nightbane')"></asp:SqlDataSource>
            <asp:SqlDataSource ID="PrinceLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Prince')"></asp:SqlDataSource>
            <asp:SqlDataSource ID="KaraTrashLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Trash' AND RaidName = 'Kara')"></asp:SqlDataSource>
            <br /><br /><br /><br />
            <asp:Label ID="Label1" runat="server" Text="Label"><b>Select Date of Kara Raid</b></asp:Label>
            <asp:Calendar ID="calendarKara" runat="server" OnSelectionChanged="calendarKara_SelectionChanged"></asp:Calendar>
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
            <h1>Attumen the Huntsman</h1>
            <br />
            <p>Item&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Player</p>

            <ajaxToolkit:ComboBox ID="comboAttumenLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="AttumenLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;"  >
            </ajaxToolkit:ComboBox>            
            <ajaxToolkit:ComboBox ID="comboAttumenPlayer1" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioAttumen1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxAttumen1" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboAttumenLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="AttumenLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboAttumenPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioAttumen2" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxAttumen2" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />            <br />
            <h1>Moroes</h1>

            <ajaxToolkit:ComboBox ID="comboMoroesLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="MoroesLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboMoroesPlayer1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioMoroes1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxMoroes1" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboMoroesLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="MoroesLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboMoroesPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioMoroes2"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxMoroes2" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboMoroesLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="MoroesLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboMoroesPlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioMoroes3"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxMoroes3" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
                <br />            <br />
            <h1>Maiden of Virtue</h1>
            <ajaxToolkit:ComboBox ID="comboMaidenLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="MaidenLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboMaidenPlayer1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioMaiden1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxMaiden1" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboMaidenLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="MaidenLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboMaidenPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>

            <asp:RadioButtonList ID="radioMaiden2"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxMaiden2" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />            <br />
            <h1>Opera Event</h1>

            <ajaxToolkit:ComboBox ID="comboOperaLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="OperaLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboOperaPlayer1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioOpera1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxOpera1" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboOperaLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="OperaLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboOperaPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioOpera2"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxOpera2" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboOperaLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="OperaLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboOperaPlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioOpera3"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxOpera3" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboOperaLoot4" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="OperaLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboOperaPlayer4" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioOpera4"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxOpera4" CssClass="inlineBlock" runat="server" Text="Sidegrade" />

                <br />            <br />
                <h1>The Curator</h1>
            <ajaxToolkit:ComboBox ID="comboCuratorLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="CuratorLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboCuratorPlayer1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioCurator1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxCurator1" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboCuratorLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="CuratorLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboCuratorPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioCurator2"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxCurator2" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboCuratorLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="CuratorLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboCuratorPlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>

            <asp:RadioButtonList ID="radioCurator3"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxCurator3" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
                <br />            <br />
                <h1>Terestian Illhoof</h1>

            <ajaxToolkit:ComboBox ID="comboIllhoofLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="IllhoofLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboIllhoofPlayer1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioIllhoof1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxIllhoof1" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboIllhoofLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="IllhoofLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboIllhoofPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
 
            <asp:RadioButtonList ID="radioIllhoof2"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
 <asp:CheckBox ID="checkboxIllhoof2" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
                <br />            <br />
                <h1>Shade of Aran</h1>

            <ajaxToolkit:ComboBox ID="comboAranLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="AranLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboAranPlayer1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioAran1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxAran1" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboAranLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="AranLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboAranPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>

            <asp:RadioButtonList ID="radioAran2"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxAran2" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
                <br />            <br />
                <h1>Netherspite</h1>

            <ajaxToolkit:ComboBox ID="comboNetherspiteLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="NetherspiteLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboNetherspitePlayer1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioNetherspite1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxNetherspite1" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboNetherspiteLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="NetherspiteLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboNetherspitePlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioNetherspite2"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxNetherspite2" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboNetherspiteLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="NetherspiteLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboNetherspitePlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>

            <asp:RadioButtonList ID="radioNetherspite3"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxNetherspite3" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
                <br />            <br />
                <h1>Chess Event</h1>

            <ajaxToolkit:ComboBox ID="comboChessLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="ChessLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboChessPlayer1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioChess1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxChess1" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboChessLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="ChessLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboChessPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioChess2"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxChess2" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboChessLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="ChessLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboChessPlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>

            <asp:RadioButtonList ID="radioChess3"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxChess3" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
                <br />            <br />
                <h1>Nightbane</h1>

            <ajaxToolkit:ComboBox ID="comboNightbaneLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="NightbaneLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboNightbanePlayer1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioNightbane1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxNightbane1" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboNightbaneLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="NightbaneLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboNightbanePlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioNightbane2"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxNightbane2" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboNightbaneLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="NightbaneLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboNightbanePlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioNightbane3"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxNightbane3" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboNightbaneLoot4" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="NightbaneLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboNightbanePlayer4" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioNightbane4"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxNightbane4" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboNightbaneLoot5" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="NightbaneLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboNightbanePlayer5" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioNightbane5"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>

                    <h1>Prince Malchezaar</h1>

            <ajaxToolkit:ComboBox ID="comboPrinceLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="PrinceLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboPrincePlayer1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioPrince1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
        <asp:CheckBox ID="checkboxPrince1" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboPrinceLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="PrinceLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboPrincePlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioPrince2"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxPrince2" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboPrinceLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="PrinceLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboPrincePlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioPrince3"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxPrince3" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboPrinceLoot4" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="PrinceLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboPrincePlayer4" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioPrince4"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxPrince4" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboPrinceLoot5" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="PrinceLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboPrincePlayer5" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioPrince5"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxPrince5" CssClass="inlineBlock" runat="server" Text="Sidegrade" />

                <br />            <br />
                <h1>Trash</h1>

            <ajaxToolkit:ComboBox ID="comboTrashLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="KaraTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboTrashPlayer1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioTrash1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash1" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboTrashLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="KaraTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboTrashPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioTrash2"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash2" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboTrashLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="KaraTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboTrashPlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioTrash3"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash3" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboTrashLoot4" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="KaraTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboTrashPlayer4" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioTrash4"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash4" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboTrashLoot5" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="KaraTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboTrashPlayer5" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioTrash5"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash5" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboTrashLoot6" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="KaraTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboTrashPlayer6" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioTrash6"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash6" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboTrashLoot7" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="KaraTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboTrashPlayer7" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioTrash7"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash7" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboTrashLoot8" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="KaraTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboTrashPlayer8" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioTrash8"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash8" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboTrashLoot9" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="KaraTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboTrashPlayer9" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioTrash9"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash9" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboTrashLoot10" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="KaraTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboTrashPlayer10" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioTrash10"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxTrash10" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
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