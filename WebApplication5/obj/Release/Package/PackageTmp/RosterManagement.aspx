<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="RosterManagement.aspx.cs" Inherits="WebApplication5.RosterManagement" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <style type="text/css">
        .inlineBlock { display: inline-block; }
    </style>

    <asp:SqlDataSource ID="Roster" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT PlayerName FROM Roster"></asp:SqlDataSource>
    
        <br /><br />  
    <h1>Roster Addtions & Updates</h1>
    <br /><br /><br />

        <p><b>Add New Player(s)</b></p>
    <p>Player&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Rank&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Class&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Subclass(Warriors/Priests)&emsp;

    </p>
    <ajaxToolkit:ComboBox ID="comboNewPlayer1" runat="server" AutoCompleteMode="SuggestAppend" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboNewPlayerRank1" runat="server" AutoCompleteMode="SuggestAppend" MaxLength="0" style="display: inline;">
        <asp:ListItem>Officer</asp:ListItem>
        <asp:ListItem>Member</asp:ListItem>
        <asp:ListItem>Trial</asp:ListItem>
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboNewPlayerClass1" runat="server" AutoCompleteMode="SuggestAppend" MaxLength="0" style="display: inline;">
        <asp:ListItem>Warrior</asp:ListItem>
        <asp:ListItem>Rogue</asp:ListItem>
        <asp:ListItem>Hunter</asp:ListItem>
        <asp:ListItem>Druid</asp:ListItem>
        <asp:ListItem>Paladin</asp:ListItem>
        <asp:ListItem>Priest</asp:ListItem>
        <asp:ListItem>Mage</asp:ListItem>
        <asp:ListItem>Warlock</asp:ListItem>
        <asp:ListItem>Shaman</asp:ListItem>
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboNewPlayerSubClass1" runat="server" AutoCompleteMode="SuggestAppend" MaxLength="0" style="display: inline;">
        <asp:ListItem>Tank</asp:ListItem>
        <asp:ListItem>DPS</asp:ListItem>
        <asp:ListItem>Shadow</asp:ListItem>
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboRaidDay1" runat="server" AutoCompleteMode="SuggestAppend" MaxLength="0" style="display: inline;">
        <asp:ListItem>1</asp:ListItem>
        <asp:ListItem>2</asp:ListItem>
    </ajaxToolkit:ComboBox>

    <asp:RadioButtonList ID="radioNewActive1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="500px" style="display: inline;">
        <asp:ListItem Selected="True">Active</asp:ListItem>
        <asp:ListItem>Inactive</asp:ListItem>
    </asp:RadioButtonList>

    <br />
    <ajaxToolkit:ComboBox ID="comboNewPlayer2" runat="server" AutoCompleteMode="SuggestAppend" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboNewPlayerRank2" runat="server" AutoCompleteMode="SuggestAppend" MaxLength="0" style="display: inline;">
        <asp:ListItem>Officer</asp:ListItem>
        <asp:ListItem>Member</asp:ListItem>
        <asp:ListItem>Trial</asp:ListItem>
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboNewPlayerClass2" runat="server" AutoCompleteMode="SuggestAppend" MaxLength="0" style="display: inline;">
        <asp:ListItem>Warrior</asp:ListItem>
        <asp:ListItem>Rogue</asp:ListItem>
        <asp:ListItem>Hunter</asp:ListItem>
        <asp:ListItem>Druid</asp:ListItem>
        <asp:ListItem>Paladin</asp:ListItem>
        <asp:ListItem>Priest</asp:ListItem>
        <asp:ListItem>Mage</asp:ListItem>
        <asp:ListItem>Warlock</asp:ListItem>
        <asp:ListItem>Shaman</asp:ListItem>
    </ajaxToolkit:ComboBox>
        <ajaxToolkit:ComboBox ID="comboNewPlayerSubClass2" runat="server" AutoCompleteMode="SuggestAppend" MaxLength="0" style="display: inline;">
        <asp:ListItem>Tank</asp:ListItem>
        <asp:ListItem>DPS</asp:ListItem>
        <asp:ListItem>Shadow</asp:ListItem>
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboRaidDay2" runat="server" AutoCompleteMode="SuggestAppend" MaxLength="0" style="display: inline;">
        <asp:ListItem>1</asp:ListItem>
        <asp:ListItem>2</asp:ListItem>
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioNewActive2"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="500px" style="display: inline;">
        <asp:ListItem Selected="True">Active</asp:ListItem>
        <asp:ListItem>Inactive</asp:ListItem>
    </asp:RadioButtonList>

        <br />
    <ajaxToolkit:ComboBox ID="comboNewPlayer3" runat="server" AutoCompleteMode="SuggestAppend" MaxLength="0" style="display: inline;">
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboNewPlayerRank3" runat="server" AutoCompleteMode="SuggestAppend" MaxLength="0" style="display: inline;">
        <asp:ListItem>Officer</asp:ListItem>
        <asp:ListItem>Member</asp:ListItem>
        <asp:ListItem>Trial</asp:ListItem>
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboNewPlayerClass3" runat="server" AutoCompleteMode="SuggestAppend" MaxLength="0" style="display: inline;">
        <asp:ListItem>Warrior</asp:ListItem>
        <asp:ListItem>Rogue</asp:ListItem>
        <asp:ListItem>Hunter</asp:ListItem>
        <asp:ListItem>Druid</asp:ListItem>
        <asp:ListItem>Paladin</asp:ListItem>
        <asp:ListItem>Priest</asp:ListItem>
        <asp:ListItem>Mage</asp:ListItem>
        <asp:ListItem>Warlock</asp:ListItem>
        <asp:ListItem>Shaman</asp:ListItem>
    </ajaxToolkit:ComboBox>
        <ajaxToolkit:ComboBox ID="comboNewPlayerSubClass3" runat="server" AutoCompleteMode="SuggestAppend" MaxLength="0" style="display: inline;">
        <asp:ListItem>Tank</asp:ListItem>
        <asp:ListItem>DPS</asp:ListItem>
        <asp:ListItem>Shadow</asp:ListItem>
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboRaidDay3" runat="server" AutoCompleteMode="SuggestAppend" MaxLength="0" style="display: inline;">
        <asp:ListItem>1</asp:ListItem>
        <asp:ListItem>2</asp:ListItem>
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioNewActive3"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="500px" style="display: inline;">
        <asp:ListItem Selected="True">Active</asp:ListItem>
        <asp:ListItem>Inactive</asp:ListItem>
    </asp:RadioButtonList>
    <br /><br />
    <asp:Button ID="buttonAddNewPlayers" runat="server" Text="Add Player(s)" OnClick="buttonAddNewPlayers_Click" />


    <br /><br /><br /><br />
    <p><b>Update Existing Player(s)</b></p>
    <p>Player&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Rank&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Class&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Subclass(Warriors/Priests)&emsp;RaidDay</p>
    <ajaxToolkit:ComboBox ID="comboUpdatePlayer1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" DropDownStyle="DropDownList" OnTextChanged="comboUpdatePlayer1_TextChanged" AutoPostBack="true">
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboUpdateRanks1" runat="server" AutoCompleteMode="SuggestAppend" MaxLength="0" style="display: inline;">
        <asp:ListItem>Officer</asp:ListItem>
        <asp:ListItem>Member</asp:ListItem>
        <asp:ListItem>Trial</asp:ListItem>
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboUpdateClass1" runat="server" AutoCompleteMode="SuggestAppend" MaxLength="0" style="display: inline;">
        <asp:ListItem>Warrior</asp:ListItem>
        <asp:ListItem>Rogue</asp:ListItem>
        <asp:ListItem>Hunter</asp:ListItem>
        <asp:ListItem>Druid</asp:ListItem>
        <asp:ListItem>Paladin</asp:ListItem>
        <asp:ListItem>Priest</asp:ListItem>
        <asp:ListItem>Mage</asp:ListItem>
        <asp:ListItem>Warlock</asp:ListItem>
        <asp:ListItem>Shaman</asp:ListItem>
    </ajaxToolkit:ComboBox>
        <ajaxToolkit:ComboBox ID="comboUpdateSubClass1" runat="server" AutoCompleteMode="SuggestAppend" MaxLength="0" style="display: inline;">
        <asp:ListItem>Tank</asp:ListItem>
        <asp:ListItem>DPS</asp:ListItem>
        <asp:ListItem>Shadow</asp:ListItem>
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboUpdateRaidDay1" runat="server" AutoCompleteMode="SuggestAppend" MaxLength="0" style="display: inline;">
        <asp:ListItem>1</asp:ListItem>
        <asp:ListItem>2</asp:ListItem>
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioUpdateActive1"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="500px" style="display: inline;">
        <asp:ListItem Selected="True">Active</asp:ListItem>
        <asp:ListItem>Inactive</asp:ListItem>
    </asp:RadioButtonList>

    <br />
    <ajaxToolkit:ComboBox ID="comboUpdatePlayer2" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  DropDownStyle="DropDownList" OnTextChanged="comboUpdatePlayer2_TextChanged" AutoPostBack="true">
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboUpdateRanks2" runat="server" AutoCompleteMode="SuggestAppend" MaxLength="0" style="display: inline;">
        <asp:ListItem>Officer</asp:ListItem>
        <asp:ListItem>Member</asp:ListItem>
        <asp:ListItem>Trial</asp:ListItem>
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboUpdateClass2" runat="server" AutoCompleteMode="SuggestAppend" MaxLength="0" style="display: inline;">
        <asp:ListItem>Warrior</asp:ListItem>
        <asp:ListItem>Rogue</asp:ListItem>
        <asp:ListItem>Hunter</asp:ListItem>
        <asp:ListItem>Druid</asp:ListItem>
        <asp:ListItem>Paladin</asp:ListItem>
        <asp:ListItem>Priest</asp:ListItem>
        <asp:ListItem>Mage</asp:ListItem>
        <asp:ListItem>Warlock</asp:ListItem>
        <asp:ListItem>Shaman</asp:ListItem>
    </ajaxToolkit:ComboBox>
        <ajaxToolkit:ComboBox ID="comboUpdateSubClass2" runat="server" AutoCompleteMode="SuggestAppend" MaxLength="0" style="display: inline;">
        <asp:ListItem>Tank</asp:ListItem>
        <asp:ListItem>DPS</asp:ListItem>
        <asp:ListItem>Shadow</asp:ListItem>
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboUpdateRaidDay2" runat="server" AutoCompleteMode="SuggestAppend" MaxLength="0" style="display: inline;">
        <asp:ListItem>1</asp:ListItem>
        <asp:ListItem>2</asp:ListItem>
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioUpdateActive2"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="500px" style="display: inline;">
        <asp:ListItem Selected="True">Active</asp:ListItem>
        <asp:ListItem>Inactive</asp:ListItem>
    </asp:RadioButtonList>

        <br />
    <ajaxToolkit:ComboBox ID="comboUpdatePlayer3" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;" DropDownStyle="DropDownList" OnTextChanged="comboUpdatePlayer3_TextChanged" AutoPostBack="true">
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboUpdateRanks3" runat="server" AutoCompleteMode="SuggestAppend" MaxLength="0" style="display: inline;">
        <asp:ListItem>Officer</asp:ListItem>
        <asp:ListItem>Member</asp:ListItem>
        <asp:ListItem>Trial</asp:ListItem>
    </ajaxToolkit:ComboBox>
    <ajaxToolkit:ComboBox ID="comboUpdateClass3" runat="server" AutoCompleteMode="SuggestAppend" MaxLength="0" style="display: inline;">
        <asp:ListItem>Warrior</asp:ListItem>
        <asp:ListItem>Rogue</asp:ListItem>
        <asp:ListItem>Hunter</asp:ListItem>
        <asp:ListItem>Druid</asp:ListItem>
        <asp:ListItem>Paladin</asp:ListItem>
        <asp:ListItem>Priest</asp:ListItem>
        <asp:ListItem>Mage</asp:ListItem>
        <asp:ListItem>Warlock</asp:ListItem>
        <asp:ListItem>Shaman</asp:ListItem>
    </ajaxToolkit:ComboBox>
        <ajaxToolkit:ComboBox ID="comboUpdateSubClass3" runat="server" AutoCompleteMode="SuggestAppend" MaxLength="0" style="display: inline;">
        <asp:ListItem>Tank</asp:ListItem>
        <asp:ListItem>DPS</asp:ListItem>
        <asp:ListItem>Shadow</asp:ListItem>
    </ajaxToolkit:ComboBox>
        <ajaxToolkit:ComboBox ID="comboUpdateRaidDay3" runat="server" AutoCompleteMode="SuggestAppend" MaxLength="0" style="display: inline;">
        <asp:ListItem>1</asp:ListItem>
        <asp:ListItem>2</asp:ListItem>
    </ajaxToolkit:ComboBox>
    <asp:RadioButtonList ID="radioUpdateActive3"  RepeatDirection="Horizontal" CssClass="inlineBlock" runat="server" Height="16px" Width="500px" style="display: inline;">
        <asp:ListItem Selected="True">Active</asp:ListItem>
        <asp:ListItem>Inactive</asp:ListItem>
    </asp:RadioButtonList>
    <br /><br />
    <asp:Button ID="buttonUpdateExistingPlayers" runat="server" Text="Update Player(s)" OnClick="buttonUpdateExistingPlayers_Click" />





        <br /><br /><br />

</asp:Content>
