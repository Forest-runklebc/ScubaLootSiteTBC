<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Info.aspx.cs" Inherits="WebApplication5.InfoB" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
        <script>var whTooltips = { colorLinks: true, iconizeLinks: true, renameLinks: true };</script>
        <script src="http://wow.zamimg.com/widgets/power.js"></script>
    
        <h1> RAID2 </h1>
        <table style="display:block;">
            <tr>
                <td style="padding: 0">
                <asp:gridview ID="tankWarriorGridViewB" runat="server" AutoGenerateColumns="false" RowStyle-Width="100" OnRowDataBound="tankWarriorGridView_RowDataBound" BorderStyle="Solid">
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
                <asp:gridview ID="dpsWarriorGridViewB" runat="server" AutoGenerateColumns="false" RowStyle-Width="100" OnRowDataBound="dpsWarriorGridView_RowDataBound" BorderStyle="Solid">
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
        <asp:gridview ID="rogueGridViewB" runat="server" AutoGenerateColumns="false" RowStyle-Width="100" OnRowDataBound="rogueGridView_RowDataBound" BorderStyle="Solid">
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
        <asp:gridview ID="hunterGridViewB" runat="server" AutoGenerateColumns="false" RowStyle-Width="100" OnRowDataBound="hunterGridView_RowDataBound" BorderStyle="Solid">
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
                <asp:gridview ID="druidGridViewB" runat="server" AutoGenerateColumns="false" RowStyle-Width="100" OnRowDataBound="druidGridView_RowDataBound" BorderStyle="Solid">
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
                <asp:gridview ID="paladinGridViewB" runat="server" AutoGenerateColumns="false" RowStyle-Width="100" OnRowDataBound="paladinGridView_RowDataBound" BorderStyle="Solid">
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
                <asp:gridview ID="priestGridViewB" runat="server" AutoGenerateColumns="false" RowStyle-Width="100" OnRowDataBound="priestGridView_RowDataBound" BorderStyle="Solid">
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
                <asp:gridview ID="shamanGridViewB" runat="server" AutoGenerateColumns="false" RowStyle-Width="100" OnRowDataBound="shamanGridView_RowDataBound" BorderStyle="Solid">
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
                <asp:gridview ID="mageGridViewB" runat="server" AutoGenerateColumns="false" RowStyle-Width="100" OnRowDataBound="mageGridView_RowDataBound" BorderStyle="Solid">
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
                <asp:gridview ID="warlockGridViewB" runat="server" AutoGenerateColumns="false" RowStyle-Width="100" OnRowDataBound="warlockGridView_RowDataBound" BorderStyle="Solid">
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
    <asp:SqlDataSource ID="RosterB" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT PlayerName FROM Roster WHERE IsActive = 1 and RaidDay = '2'"></asp:SqlDataSource>
    <asp:SqlDataSource ID="AllLootB" runat="server" ConnectionString="<%$ ConnectionStrings:BLAKE %>" SelectCommand="SELECT distinct ItemName from Loot where IsActive = 1"></asp:SqlDataSource>
    <style type="text/css">
        .inlineBlock { display: inline-block; }     
    </style>

    <p><b>Players With Item</b></p>
    <ajaxToolkit:ComboBox ID="comboItemNameToSearchB" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="AllLootB" DataTextField="ItemName" DataValueField="ItemName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox><br />
    <asp:Button ID="getPlayersWithItemB" runat="server" Text="Show Players With Item" OnClick="getPlayersWithItem_Click"/><br />
    <asp:Label ID="labelPlayersWithItemB" runat="server" Text="Label" Visible="False"></asp:Label>
    <br /><br /><br />

    
    <table border="1">
        <thead>
            <tr>
                <th>
                <p><b>Player Loot History</b></p>
    <ajaxToolkit:ComboBox ID="comboPlayer1B" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="RosterB" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox><br />
    <asp:Button ID="getPlayerLootHistoryB" runat="server" Text="Show Player Loot History" OnClick="getPlayerLootHistory_Click"/><br /><br />
                </th>
             <th>
    <p><b>Player Loot History</b></p>
    <ajaxToolkit:ComboBox ID="comboPlayer2B" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="RosterB" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox><br />
    <asp:Button ID="getPlayerLootHistory2B" runat="server" Text="Show Player Loot History" OnClick="getPlayerLootHistory2_Click"/><br /><br />
                 </th>
                             <th>
    <p><b>Player Loot History</b></p>
    <ajaxToolkit:ComboBox ID="comboPlayer3B" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="RosterB" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox><br />
    <asp:Button ID="getPlayerLootHistory3B" runat="server" Text="Show Player Loot History" OnClick="getPlayerLootHistory3_Click"/><br /><br />
                 </th>
                </tr>
        </thead>
        <tr>
            <td>    
                    <asp:Label ID="labelLastLoot1B" runat="server" Text="Last Loot: " Visible="True" Font-Bold="True"></asp:Label>
                    <asp:Literal ID="literalLastLoot1B" runat="server" /><br /><br />

                    <asp:Label ID="labelT4B" runat="server" Text="Tier 4:" Visible="True" Font-Bold="True"></asp:Label>
                    <asp:Literal ID="literalT4B" runat="server" /><br />

                    <asp:Label ID="labelKaraB" runat="server" Text="Karazhan:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalKaraB" runat="server" /><br />

                    <asp:Label ID="labelGruulB" runat="server" Text="Gruul's Lair:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalGruulB" runat="server" /><br />

                    <asp:Label ID="labelMagB" runat="server" Text="Magtheridon:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalMagB" runat="server" /><br />

                    <asp:Label ID="labelT5B" runat="server" Text="Tier 5:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalT5B" runat="server" /><br />

                    <asp:Label ID="labelSSCB" runat="server" Text="Serpentshrine Cavern:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalSSCB" runat="server" /><br />

                    <asp:Label ID="labelTKB" runat="server" Text="Tempest Keep:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalTKB" runat="server" /><br />

                    <asp:Label ID="labelT6B" runat="server" Text="Tier 6:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalT6B" runat="server" /><br />

                    <asp:Label ID="labelHyjalB" runat="server" Text="Hyjal Summit:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalHyjalB" runat="server" /><br />

                    <asp:Label ID="labelBTB" runat="server" Text="Black Temple:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalBTB" runat="server" /><br />

                    <asp:Label ID="labelSWPB" runat="server" Text="Sunwell Plateau:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalSWPB" runat="server" /><br />
            </td>

            <td>
                    <asp:Label ID="labelLastLoot2B" runat="server" Text="Last Loot: " Visible="True" Font-Bold="True"></asp:Label>
                    <asp:Literal ID="literalLastLoot2B" runat="server" /><br /><br />

                    <asp:Label ID="labelT4bB" runat="server" Text="Tier 4:" Visible="True" Font-Bold="True"></asp:Label>
                    <asp:Literal ID="literalT4bB" runat="server" /><br />

                    <asp:Label ID="labelKarabB" runat="server" Text="Karazhan:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalKarabB" runat="server" /><br />

                    <asp:Label ID="labelGruulbB" runat="server" Text="Gruul's Lair:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalGruulbB" runat="server" /><br />

                    <asp:Label ID="labelMagbB" runat="server" Text="Magtheridon:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalMagbB" runat="server" /><br />

                    <asp:Label ID="labelT5bB" runat="server" Text="Tier 5:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalT5bB" runat="server" /><br />

                    <asp:Label ID="labelSSCbB" runat="server" Text="Serpentshrine Cavern:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalSSCbB" runat="server" /><br />

                    <asp:Label ID="labelTKbB" runat="server" Text="Tempest Keep:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalTKbB" runat="server" /><br />

                    <asp:Label ID="labelT6bB" runat="server" Text="Tier 6:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalT6bB" runat="server" /><br />

                    <asp:Label ID="labelHyjalbB" runat="server" Text="Hyjal Summit:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalHyjalbB" runat="server" /><br />

                    <asp:Label ID="labelBTbB" runat="server" Text="Black Temple:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalBTbB" runat="server" /><br />

                    <asp:Label ID="labelSWPbB" runat="server" Text="Sunwell Plateau:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalSWPbB" runat="server" /><br />

                </td>

                <td>
                    <asp:Label ID="labelLastLoot3B" runat="server" Text="Last Loot: " Visible="True" Font-Bold="True"></asp:Label>
                    <asp:Literal ID="literalLastLoot3B" runat="server" /><br /><br />

                    <asp:Label ID="labelT4cB" runat="server" Text="Tier 4:" Visible="True" Font-Bold="True"></asp:Label>
                    <asp:Literal ID="literalT4cB" runat="server" /><br />

                    <asp:Label ID="labelKaracB" runat="server" Text="Karazhan:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalKaracB" runat="server" /><br />

                    <asp:Label ID="labelGruulcB" runat="server" Text="Gruul's Lair:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalGruulcB" runat="server" /><br />

                    <asp:Label ID="labelMagcB" runat="server" Text="Magtheridon:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalMagcB" runat="server" /><br />

                    <asp:Label ID="labelT5cB" runat="server" Text="Tier 5:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalT5cB" runat="server" /><br />

                    <asp:Label ID="labelSSCcB" runat="server" Text="Serpentshrine Cavern:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalSSCcB" runat="server" /><br />

                    <asp:Label ID="labelTKcB" runat="server" Text="Tempest Keep:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalTKcB" runat="server" /><br />

                    <asp:Label ID="labelT6cB" runat="server" Text="Tier 6:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalT6cB" runat="server" /><br />

                    <asp:Label ID="labelHyjalcB" runat="server" Text="Hyjal Summit:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalHyjalcB" runat="server" /><br />

                    <asp:Label ID="labelBTcB" runat="server" Text="Black Temple:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalBTcB" runat="server" /><br />

                    <asp:Label ID="labelSWPcB" runat="server" Text="Sunwell Plateau:" Visible="True" Font-Bold="True"></asp:Label><br />
                    <asp:Literal ID ="literalSWPcB" runat="server" /><br />

                </td>
            </tr>
    </table>

    <br />
    <p><b>Player Raid Attendance History</b></p>
    <ajaxToolkit:ComboBox ID="comboPlayerAttendanceHistoryB" runat="server" CssClass="inlineBlock" AutoCompleteMode="SuggestAppend" DataSourceID="RosterB" DataTextField="PlayerName" DataValueField="PlayerName" MaxLength="0" style="display: inline;"  >
    </ajaxToolkit:ComboBox><br />
    <asp:Button ID="getPlayerAttendanceHistoryB" runat="server" Text="Show Player Attendance History" OnClick="getPlayerAttendanceHistory_Click"/><br /><br />
    <asp:Label ID="labelAttendanceHistoryB" runat="server"  Visible="True" Font-Bold="True"></asp:Label><br />
    <asp:Literal ID="literalAttendanceHistoryB" runat="server" /><br />
    </asp:Content>

