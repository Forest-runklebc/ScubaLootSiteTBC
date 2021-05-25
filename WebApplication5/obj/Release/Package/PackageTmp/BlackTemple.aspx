<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="BlackTemple.aspx.cs" Inherits="WebApplication5.BlackTemple" %>

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
            <asp:SqlDataSource ID="NajentusLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Najentus')"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SupremusLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Supremus')"></asp:SqlDataSource>
            <asp:SqlDataSource ID="ShadeLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Shade')"></asp:SqlDataSource>
            <asp:SqlDataSource ID="GorefiendLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Gorefiend')"></asp:SqlDataSource>
            <asp:SqlDataSource ID="BloodboilLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Bloodboil')"></asp:SqlDataSource>
            <asp:SqlDataSource ID="ReliquaryLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Reliquary')"></asp:SqlDataSource>
            <asp:SqlDataSource ID="ShahrazLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Shahraz')"></asp:SqlDataSource>
            <asp:SqlDataSource ID="CouncilLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Council')"></asp:SqlDataSource>
            <asp:SqlDataSource ID="IllidanLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Illidan')"></asp:SqlDataSource>
            <asp:SqlDataSource ID="BlackTempleTrashLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT ItemName FROM Loot WHERE (BossName = 'Trash' AND RaidName = 'BT')"></asp:SqlDataSource>
            <br /><br /><br /><br />
            <asp:Label ID="Label1" runat="server" Text="Label"><b>Select Date of BlackTemple Raid</b></asp:Label>
            <asp:Calendar ID="calendarBlackTemple" runat="server" OnSelectionChanged="calendarBlackTemple_SelectionChanged"></asp:Calendar>
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
            <h1>High Warlord Naj'entus</h1>
            <br />
            <p>Item&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Player</p>

            <ajaxToolkit:ComboBox ID="comboNajentusLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="NajentusLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;"  >
            </ajaxToolkit:ComboBox>            
            <ajaxToolkit:ComboBox ID="comboNajentusPlayer1" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioNajentus1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxNajentus1" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboNajentusLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="NajentusLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboNajentusPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioNajentus2" RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxNajentus2" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />            <br />
            <h1>Supremus</h1>

            <ajaxToolkit:ComboBox ID="comboSupremusLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="SupremusLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;" >
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboSupremusPlayer1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioSupremus1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxSupremus1" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboSupremusLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="SupremusLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboSupremusPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioSupremus2"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxSupremus2" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboSupremusLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="SupremusLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboSupremusPlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" >
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioSupremus3"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxSupremus3" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
                <br />            <br />
            <h1>Shade of Akama</h1>
            <ajaxToolkit:ComboBox ID="comboShadeLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="ShadeLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboShadePlayer1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioShade1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxShade1" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboShadeLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="ShadeLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboShadePlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>

            <asp:RadioButtonList ID="radioShade2"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxShade2" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />            <br />
            <h1>Teron Gorefiend</h1>

            <ajaxToolkit:ComboBox ID="comboGorefiendLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="GorefiendLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboGorefiendPlayer1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioGorefiend1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxGorefiend1" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboGorefiendLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="GorefiendLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboGorefiendPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioGorefiend2"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxGorefiend2" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboGorefiendLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="GorefiendLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboGorefiendPlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioGorefiend3"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxGorefiend3" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboGorefiendLoot4" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="GorefiendLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboGorefiendPlayer4" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioGorefiend4"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxGorefiend4" CssClass="inlineBlock" runat="server" Text="Sidegrade" />

                <br />            <br />
                <h1>Gurtogg Bloodboil</h1>
            <ajaxToolkit:ComboBox ID="comboBloodboilLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="BloodboilLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboBloodboilPlayer1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioBloodboil1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxBloodboil1" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboBloodboilLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="BloodboilLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboBloodboilPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioBloodboil2"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxBloodboil2" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboBloodboilLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="BloodboilLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboBloodboilPlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>

            <asp:RadioButtonList ID="radioBloodboil3"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxBloodboil3" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
                <br />            <br />
                <h1>Reliquary of Souls</h1>

            <ajaxToolkit:ComboBox ID="comboReliquaryLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="ReliquaryLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboReliquaryPlayer1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioReliquary1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxReliquary1" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboReliquaryLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="ReliquaryLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboReliquaryPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
 
            <asp:RadioButtonList ID="radioReliquary2"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
 <asp:CheckBox ID="checkboxReliquary2" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
                <br />            <br />
                <h1>Mother Shahraz</h1>

            <ajaxToolkit:ComboBox ID="comboShahrazLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="ShahrazLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboShahrazPlayer1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioShahraz1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxShahraz1" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboShahrazLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="ShahrazLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboShahrazPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>

            <asp:RadioButtonList ID="radioShahraz2"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxShahraz2" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
                <br />            <br />
                <h1>The Illidari Council</h1>

            <ajaxToolkit:ComboBox ID="comboCouncilLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="CouncilLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboCouncilPlayer1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioCouncil1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxCouncil1" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboCouncilLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="CouncilLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboCouncilPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioCouncil2"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxCouncil2" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboCouncilLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="CouncilLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboCouncilPlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>

            <asp:RadioButtonList ID="radioCouncil3"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxCouncil3" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
                <br />            <br />
                <h1>Illidan Stormrage</h1>

            <ajaxToolkit:ComboBox ID="comboIllidanLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="IllidanLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboIllidanPlayer1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioIllidan1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxIllidan1" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboIllidanLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="IllidanLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboIllidanPlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <asp:RadioButtonList ID="radioIllidan2"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxIllidan2" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
            <br />
            <ajaxToolkit:ComboBox ID="comboIllidanLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="IllidanLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>
            <ajaxToolkit:ComboBox ID="comboIllidanPlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;">
            </ajaxToolkit:ComboBox>

            <asp:RadioButtonList ID="radioIllidan3"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="225px">
                <asp:ListItem Selected="True">Mainspec</asp:ListItem>
                <asp:ListItem>Offspec</asp:ListItem>
                <asp:ListItem>PvP</asp:ListItem>
            </asp:RadioButtonList>
    <asp:CheckBox ID="checkboxIllidan3" CssClass="inlineBlock" runat="server" Text="Sidegrade" />
                <br />            <br />

                <br />            <br />
                <h1>Trash</h1>

            <ajaxToolkit:ComboBox ID="comboTrashLoot1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="BlackTempleTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
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
            <ajaxToolkit:ComboBox ID="comboTrashLoot2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="BlackTempleTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
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
            <ajaxToolkit:ComboBox ID="comboTrashLoot3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="BlackTempleTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
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
            <ajaxToolkit:ComboBox ID="comboTrashLoot4" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="BlackTempleTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
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
            <ajaxToolkit:ComboBox ID="comboTrashLoot5" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="BlackTempleTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
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
            <ajaxToolkit:ComboBox ID="comboTrashLoot6" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="BlackTempleTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
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
            <ajaxToolkit:ComboBox ID="comboTrashLoot7" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="BlackTempleTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
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
            <ajaxToolkit:ComboBox ID="comboTrashLoot8" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="BlackTempleTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
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
            <ajaxToolkit:ComboBox ID="comboTrashLoot9" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="BlackTempleTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
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
            <ajaxToolkit:ComboBox ID="comboTrashLoot10" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="BlackTempleTrashLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;">
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