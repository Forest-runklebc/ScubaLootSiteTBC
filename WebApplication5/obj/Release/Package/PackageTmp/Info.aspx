<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Info.aspx.cs" Inherits="WebApplication5.Info" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
        <script>var whTooltips = { colorLinks: true, iconizeLinks: true, renameLinks: true };</script>
        <script src="http://wow.zamimg.com/widgets/power.js"></script>
    
        <h1> RAID1 </h1>
        <table style="display:block;">
            <tr>
                <td style="padding: 0">
                <asp:gridview ID="tankWarriorGridView" runat="server" AutoGenerateColumns="false" RowStyle-Width="100" OnRowDataBound="tankWarriorGridView_RowDataBound" BorderStyle="Solid">
                    <Columns>
                    <asp:BoundField DataField="PlayerName" HeaderText ="Tank"/>
                    <asp:BoundField DataField="ForeverLootScore" HeaderText ="Loot" ItemStyle-HorizontalAlign="Right" >
                        <ItemStyle HorizontalAlign="Right"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="ForeverAttendanceValue" HeaderText ="Raids" ItemStyle-HorizontalAlign="Right">
                        <ItemStyle HorizontalAlign="Right"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="RecentPercentageAttendance" HeaderText ="Attendance" ItemStyle-HorizontalAlign="Right">
                        <ItemStyle HorizontalAlign="Right"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="PvpLootScore" HeaderText ="PvP" ItemStyle-HorizontalAlign="Right">
                        <ItemStyle HorizontalAlign="Right"></ItemStyle>
                    </asp:BoundField>
                    </Columns>

                </asp:gridview>
                </td>

                <td style="padding: 0">
                <asp:gridview ID="dpsWarriorGridView" runat="server" AutoGenerateColumns="false" RowStyle-Width="100" OnRowDataBound="dpsWarriorGridView_RowDataBound" BorderStyle="Solid">
                        <Columns>
                            <asp:BoundField DataField="PlayerName" HeaderText ="DPS War"/>
                            <asp:BoundField DataField="ForeverLootScore" HeaderText ="Loot" ItemStyle-HorizontalAlign="Right" >
                                <ItemStyle HorizontalAlign="Right"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="ForeverAttendanceValue" HeaderText ="Raids" ItemStyle-HorizontalAlign="Right">
                                <ItemStyle HorizontalAlign="Right"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="RecentPercentageAttendance" HeaderText ="Attendance" ItemStyle-HorizontalAlign="Right">
                                <ItemStyle HorizontalAlign="Right"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="PvpLootScore" HeaderText ="PvP" ItemStyle-HorizontalAlign="Right">
                                <ItemStyle HorizontalAlign="Right"></ItemStyle>
                            </asp:BoundField>
                    </Columns>
                </asp:gridview>
                </td>


                <td style="padding: 0">
        <asp:gridview ID="rogueGridView" runat="server" AutoGenerateColumns="false" RowStyle-Width="100" OnRowDataBound="rogueGridView_RowDataBound" BorderStyle="Solid">
                        <Columns>
                <asp:BoundField DataField="PlayerName" HeaderText ="Rogue"/>
                <asp:BoundField DataField="ForeverLootScore" HeaderText ="Loot" ItemStyle-HorizontalAlign="Right" >
                    <ItemStyle HorizontalAlign="Right"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="ForeverAttendanceValue" HeaderText ="Raids" ItemStyle-HorizontalAlign="Right">
                    <ItemStyle HorizontalAlign="Right"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="RecentPercentageAttendance" HeaderText ="Attendance" ItemStyle-HorizontalAlign="Right">
                    <ItemStyle HorizontalAlign="Right"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="PvpLootScore" HeaderText ="PvP" ItemStyle-HorizontalAlign="Right">
                    <ItemStyle HorizontalAlign="Right"></ItemStyle>
                </asp:BoundField>
            </Columns>
        </asp:gridview>
                </td>

                                <td style="padding: 0">
        <asp:gridview ID="hunterGridView" runat="server" AutoGenerateColumns="false" RowStyle-Width="100" OnRowDataBound="hunterGridView_RowDataBound" BorderStyle="Solid">
                        <Columns>
                <asp:BoundField DataField="PlayerName" HeaderText ="Hunter"/>
                <asp:BoundField DataField="ForeverLootScore" HeaderText ="Loot" ItemStyle-HorizontalAlign="Right" >
                    <ItemStyle HorizontalAlign="Right"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="ForeverAttendanceValue" HeaderText ="Raids" ItemStyle-HorizontalAlign="Right">
                    <ItemStyle HorizontalAlign="Right"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="RecentPercentageAttendance" HeaderText ="Attendance" ItemStyle-HorizontalAlign="Right">
                    <ItemStyle HorizontalAlign="Right"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="PvpLootScore" HeaderText ="PvP" ItemStyle-HorizontalAlign="Right">
                <ItemStyle HorizontalAlign="Right"></ItemStyle>
                </asp:BoundField>
            </Columns>
        </asp:gridview>
                </td>
            </tr>

            <tr>
                <td style="padding: 0">
                <asp:gridview ID="druidGridView" runat="server" AutoGenerateColumns="false" RowStyle-Width="100" OnRowDataBound="druidGridView_RowDataBound" BorderStyle="Solid">
                    <Columns>
                    <asp:BoundField DataField="PlayerName" HeaderText ="Druid"/>
                    <asp:BoundField DataField="ForeverLootScore" HeaderText ="Loot" ItemStyle-HorizontalAlign="Right" >
                        <ItemStyle HorizontalAlign="Right"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="ForeverAttendanceValue" HeaderText ="Raids" ItemStyle-HorizontalAlign="Right">
                        <ItemStyle HorizontalAlign="Right"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="RecentPercentageAttendance" HeaderText ="Attendance" ItemStyle-HorizontalAlign="Right">
                        <ItemStyle HorizontalAlign="Right"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="PvpLootScore" HeaderText ="PvP" ItemStyle-HorizontalAlign="Right">
                    <ItemStyle HorizontalAlign="Right"></ItemStyle>
                    </asp:BoundField>
                    </Columns>
                </asp:gridview>
                </td>
                <td style="padding: 0">
                <asp:gridview ID="paladinGridView" runat="server" AutoGenerateColumns="false" RowStyle-Width="100" OnRowDataBound="paladinGridView_RowDataBound" BorderStyle="Solid">
                    <Columns>
                    <asp:BoundField DataField="PlayerName" HeaderText ="Paladin"/>
                    <asp:BoundField DataField="ForeverLootScore" HeaderText ="Loot" ItemStyle-HorizontalAlign="Right" >
                        <ItemStyle HorizontalAlign="Right"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="ForeverAttendanceValue" HeaderText ="Raids" ItemStyle-HorizontalAlign="Right">
                        <ItemStyle HorizontalAlign="Right"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="RecentPercentageAttendance" HeaderText ="Attendance" ItemStyle-HorizontalAlign="Right">
                        <ItemStyle HorizontalAlign="Right"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="PvpLootScore" HeaderText ="PvP" ItemStyle-HorizontalAlign="Right">
                    <ItemStyle HorizontalAlign="Right"></ItemStyle>
                    </asp:BoundField>
                    </Columns>
                </asp:gridview>
                </td>
                <td style="padding: 0">
                <asp:gridview ID="priestGridView" runat="server" AutoGenerateColumns="false" RowStyle-Width="100" OnRowDataBound="priestGridView_RowDataBound" BorderStyle="Solid">
                    <Columns>
                    <asp:BoundField DataField="PlayerName" HeaderText ="Priest" HeaderStyle-ForeColor="White"/>
                    <asp:BoundField DataField="ForeverLootScore" HeaderText ="Loot" ItemStyle-HorizontalAlign="Right" HeaderStyle-ForeColor="White">
                        <ItemStyle HorizontalAlign="Right"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="ForeverAttendanceValue" HeaderText ="Raids" ItemStyle-HorizontalAlign="Right" HeaderStyle-ForeColor="White">
                        <ItemStyle HorizontalAlign="Right"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="RecentPercentageAttendance" HeaderText ="Attendance" ItemStyle-HorizontalAlign="Right" HeaderStyle-ForeColor="White">
                        <ItemStyle HorizontalAlign="Right"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="PvpLootScore" HeaderText ="PvP" ItemStyle-HorizontalAlign="Right" HeaderStyle-ForeColor="White">
                    <ItemStyle HorizontalAlign="Right"></ItemStyle>
                    </asp:BoundField>
                    </Columns>
                </asp:gridview>
                <td style="padding: 0">
                <asp:gridview ID="shamanGridView" runat="server" AutoGenerateColumns="false" RowStyle-Width="100" OnRowDataBound="shamanGridView_RowDataBound" BorderStyle="Solid">
                    <Columns>
                    <asp:BoundField DataField="PlayerName" HeaderText ="Shaman"/>
                    <asp:BoundField DataField="ForeverLootScore" HeaderText ="Loot" ItemStyle-HorizontalAlign="Right" >
                        <ItemStyle HorizontalAlign="Right"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="ForeverAttendanceValue" HeaderText ="Raids" ItemStyle-HorizontalAlign="Right">
                        <ItemStyle HorizontalAlign="Right"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="RecentPercentageAttendance" HeaderText ="Attendance" ItemStyle-HorizontalAlign="Right">
                        <ItemStyle HorizontalAlign="Right"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="PvpLootScore" HeaderText ="PvP" ItemStyle-HorizontalAlign="Right">
                    <ItemStyle HorizontalAlign="Right"></ItemStyle>
                    </asp:BoundField>
                    </Columns>
                </asp:gridview>
                </td>
                </td>


            </tr>
            <tr>
                <td style="padding: 0">
                <asp:gridview ID="mageGridView" runat="server" AutoGenerateColumns="false" RowStyle-Width="100" OnRowDataBound="mageGridView_RowDataBound" BorderStyle="Solid">
                    <Columns>
                    <asp:BoundField DataField="PlayerName" HeaderText ="Mage"/>
                    <asp:BoundField DataField="ForeverLootScore" HeaderText ="Loot" ItemStyle-HorizontalAlign="Right">
                        <ItemStyle HorizontalAlign="Right"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="ForeverAttendanceValue" HeaderText ="Raids" ItemStyle-HorizontalAlign="Right">
                        <ItemStyle HorizontalAlign="Right"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="RecentPercentageAttendance" HeaderText ="Attendance" ItemStyle-HorizontalAlign="Right">
                        <ItemStyle HorizontalAlign="Right"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="PvpLootScore" HeaderText ="PvP" ItemStyle-HorizontalAlign="Right">
                    <ItemStyle HorizontalAlign="Right"></ItemStyle>
                    </asp:BoundField>
                    </Columns>
                </asp:gridview>
                </td>
                <td style="padding: 0">
                <asp:gridview ID="warlockGridView" runat="server" AutoGenerateColumns="false" RowStyle-Width="100" OnRowDataBound="warlockGridView_RowDataBound" BorderStyle="Solid">
                    <Columns>
                    <asp:BoundField DataField="PlayerName" HeaderText ="Warlock"/>
                    <asp:BoundField DataField="ForeverLootScore" HeaderText ="Loot" ItemStyle-HorizontalAlign="Right">
                        <ItemStyle HorizontalAlign="Right"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="ForeverAttendanceValue" HeaderText ="Raids" ItemStyle-HorizontalAlign="Right">
                        <ItemStyle HorizontalAlign="Right"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="RecentPercentageAttendance" HeaderText ="Attendance" ItemStyle-HorizontalAlign="Right">
                        <ItemStyle HorizontalAlign="Right"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="PvpLootScore" HeaderText ="PvP" ItemStyle-HorizontalAlign="Right">
                    <ItemStyle HorizontalAlign="Right"></ItemStyle>
                    </asp:BoundField>
                    </Columns>
                </asp:gridview>
                </td>
            </tr>
        </table>


        <br />
        <br />



    <br />
    <asp:SqlDataSource ID="Roster" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT PlayerName FROM Roster WHERE IsActive = 1"></asp:SqlDataSource>
    <asp:SqlDataSource ID="AllLoot" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT distinct ItemName from Loot where IsActive = 1"></asp:SqlDataSource>
    <style type="text/css">
        .inlineBlock { display: inline-block; }     
    </style>

    <p><b>Players With Item</b></p>
    <ajaxToolkit:ComboBox ID="comboItemNameToSearch" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="AllLoot" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox><br />
    <asp:Button ID="getPlayersWithItem" runat="server" Text="Show Players With Item" OnClick="getPlayersWithItem_Click"/><br />
    <asp:Label ID="labelPlayersWithItem" runat="server" Text="Label" Visible="False"></asp:Label>
    <br /><br /><br />

    
    <table border="1">
        <thead>
            <tr>
                <th>
                <p><b>Player Loot History</b></p>
    <ajaxToolkit:ComboBox ID="comboPlayer1" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox><br />
    <asp:Button ID="getPlayerLootHistory" runat="server" Text="Show Player Loot History" OnClick="getPlayerLootHistory_Click"/><br /><br />
                </th>
             <th>
    <p><b>Player Loot History</b></p>
    <ajaxToolkit:ComboBox ID="comboPlayer2" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox><br />
    <asp:Button ID="getPlayerLootHistory2" runat="server" Text="Show Player Loot History" OnClick="getPlayerLootHistory2_Click"/><br /><br />
                 </th>
                             <th>
    <p><b>Player Loot History</b></p>
    <ajaxToolkit:ComboBox ID="comboPlayer3" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox><br />
    <asp:Button ID="getPlayerLootHistory3" runat="server" Text="Show Player Loot History" OnClick="getPlayerLootHistory3_Click"/><br /><br />
                 </th>
                </tr>
        </thead>
        <tr>
            <td>    
                    <asp:Label ID="labelLastLoot1" runat="server" Text="Last Loot: " Visible="True" Font-Bold="True"></asp:Label>
                    <asp:Literal ID="literalLastLoot1" runat="server" /><br /><br />

                    <asp:Label ID="labelT4" runat="server" Text="Tier 4:" Visible="True" Font-Bold="True"></asp:Label>
                    <asp:Literal ID="literalT4" runat="server" /><br />

                    <asp:Label ID="labelKara" runat="server" Text="Karazhan:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalKara" runat="server" /><br />

                    <asp:Label ID="labelGruul" runat="server" Text="Gruul's Lair:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalGruul" runat="server" /><br />

                    <asp:Label ID="labelMag" runat="server" Text="Magtheridon:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalMag" runat="server" /><br />

                    <asp:Label ID="labelT5" runat="server" Text="Tier 5:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalT5" runat="server" /><br />

                    <asp:Label ID="labelSSC" runat="server" Text="Serpentshrine Cavern:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalSSC" runat="server" /><br />

                    <asp:Label ID="labelTK" runat="server" Text="Tempest Keep:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalTK" runat="server" /><br />

                    <asp:Label ID="labelT6" runat="server" Text="Tier 6:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalT6" runat="server" /><br />

                    <asp:Label ID="labelHyjal" runat="server" Text="Hyjal Summit:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalHyjal" runat="server" /><br />

                    <asp:Label ID="labelBT" runat="server" Text="Black Temple:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalBT" runat="server" /><br />

                    <asp:Label ID="labelSWP" runat="server" Text="Sunwell Plateau:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalSWP" runat="server" /><br />
            </td>

            <td>
                    <asp:Label ID="labelLastLoot2" runat="server" Text="Last Loot: " Visible="True" Font-Bold="True"></asp:Label>
                    <asp:Literal ID="literalLastLoot2" runat="server" /><br /><br />

                    <asp:Label ID="labelT4b" runat="server" Text="Tier 4:" Visible="True" Font-Bold="True"></asp:Label>
                    <asp:Literal ID="literalT4b" runat="server" /><br />

                    <asp:Label ID="labelKarab" runat="server" Text="Karazhan:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalKarab" runat="server" /><br />

                    <asp:Label ID="labelGruulb" runat="server" Text="Gruul's Lair:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalGruulb" runat="server" /><br />

                    <asp:Label ID="labelMagb" runat="server" Text="Magtheridon:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalMagb" runat="server" /><br />

                    <asp:Label ID="labelT5b" runat="server" Text="Tier 5:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalT5b" runat="server" /><br />

                    <asp:Label ID="labelSSCb" runat="server" Text="Serpentshrine Cavern:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalSSCb" runat="server" /><br />

                    <asp:Label ID="labelTKb" runat="server" Text="Tempest Keep:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalTKb" runat="server" /><br />

                    <asp:Label ID="labelT6b" runat="server" Text="Tier 6:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalT6b" runat="server" /><br />

                    <asp:Label ID="labelHyjalb" runat="server" Text="Hyjal Summit:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalHyjalb" runat="server" /><br />

                    <asp:Label ID="labelBTb" runat="server" Text="Black Temple:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalBTb" runat="server" /><br />

                    <asp:Label ID="labelSWPb" runat="server" Text="Sunwell Plateau:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalSWPb" runat="server" /><br />

                </td>

                <td>
                    <asp:Label ID="labelLastLoot3" runat="server" Text="Last Loot: " Visible="True" Font-Bold="True"></asp:Label>
                    <asp:Literal ID="literalLastLoot3" runat="server" /><br /><br />

                    <asp:Label ID="labelT4c" runat="server" Text="Tier 4:" Visible="True" Font-Bold="True"></asp:Label>
                    <asp:Literal ID="literalT4c" runat="server" /><br />

                    <asp:Label ID="labelKarac" runat="server" Text="Karazhan:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalKarac" runat="server" /><br />

                    <asp:Label ID="labelGruulc" runat="server" Text="Gruul's Lair:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalGruulc" runat="server" /><br />

                    <asp:Label ID="labelMagc" runat="server" Text="Magtheridon:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalMagc" runat="server" /><br />

                    <asp:Label ID="labelT5c" runat="server" Text="Tier 5:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalT5c" runat="server" /><br />

                    <asp:Label ID="labelSSCc" runat="server" Text="Serpentshrine Cavern:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalSSCc" runat="server" /><br />

                    <asp:Label ID="labelTKc" runat="server" Text="Tempest Keep:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalTKc" runat="server" /><br />

                    <asp:Label ID="labelT6c" runat="server" Text="Tier 6:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalT6c" runat="server" /><br />

                    <asp:Label ID="labelHyjalc" runat="server" Text="Hyjal Summit:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalHyjalc" runat="server" /><br />

                    <asp:Label ID="labelBTc" runat="server" Text="Black Temple:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalBTc" runat="server" /><br />

                    <asp:Label ID="labelSWPc" runat="server" Text="Sunwell Plateau:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalSWPc" runat="server" /><br />

                </td>
            </tr>
    </table>

    <br />
    <p><b>Player Raid Attendance History</b></p>
    <ajaxToolkit:ComboBox ID="comboPlayerAttendanceHistory" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="Roster" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox><br />
    <asp:Button ID="getPlayerAttendanceHistory" runat="server" Text="Show Player Attendance History" OnClick="getPlayerAttendanceHistory_Click"/><br /><br />
    <asp:Label ID="labelAttendanceHistory" runat="server"  Visible="True" Font-Bold="True"></asp:Label><br />
    <asp:Literal ID="literalAttendanceHistory" runat="server" /><br />
    </asp:Content>

