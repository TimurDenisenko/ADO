<%@ Page Title="Õpilase lisamine" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="ADO.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>.</h2>
        <h3>Lisa uus õpilane</h3>
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="opilaneId" DataSourceID="SqlDataSource_opilane" DefaultMode="Insert" OnPageIndexChanging="DetailsView1_PageIndexChanging">
            <Fields>
                <asp:BoundField DataField="opilaneId" HeaderText="opilaneId" InsertVisible="False" ReadOnly="True" SortExpression="opilaneId" />
                <asp:BoundField DataField="eesnimi" HeaderText="eesnimi" SortExpression="eesnimi" />
                <asp:BoundField DataField="perenimi" HeaderText="perenimi" SortExpression="perenimi" />
                <asp:TemplateField HeaderText="synniaeg" SortExpression="synniaeg">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("synniaeg") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("synniaeg") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Ryhm_ryhmId" SortExpression="Ryhm_ryhmId">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Ryhm_ryhmId") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource_ryhm" DataTextField="ryhmNimi" DataValueField="ryhmId" SelectedValue='<%# Bind("Ryhm_ryhmId") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource_ryhm" runat="server" ConnectionString="<%$ ConnectionStrings:kutsekool_DenisenkoConnectionString1 %>" DeleteCommand="DELETE FROM [RyhmSet] WHERE [ryhmId] = @ryhmId" InsertCommand="INSERT INTO [RyhmSet] ([ryhmNimi]) VALUES (@ryhmNimi)" SelectCommand="SELECT [ryhmNimi], [ryhmId] FROM [RyhmSet]" UpdateCommand="UPDATE [RyhmSet] SET [ryhmNimi] = @ryhmNimi WHERE [ryhmId] = @ryhmId">
                            <DeleteParameters>
                                <asp:Parameter Name="ryhmId" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="ryhmNimi" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="ryhmNimi" Type="String" />
                                <asp:Parameter Name="ryhmId" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:SqlDataSource ID="SqlDataSource_ryhm" runat="server" ConnectionString="<%$ ConnectionStrings:kutsekool_DenisenkoConnectionString1 %>" SelectCommand="SELECT ryhmNimi, ryhmId FROM RyhmSet"></asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="keskmine_hinne" HeaderText="keskmine_hinne" SortExpression="keskmine_hinne" />
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
    </asp:DetailsView>
        
    <asp:SqlDataSource ID="SqlDataSource_opilane" runat="server" ConnectionString="<%$ ConnectionStrings:kutsekool_DenisenkoConnectionString1 %>" DeleteCommand="DELETE FROM [OpilaneSet] WHERE [opilaneId] = @opilaneId" InsertCommand="INSERT INTO [OpilaneSet] ([eesnimi], [perenimi], [synniaeg], [Ryhm_ryhmId], [keskmine_hinne]) VALUES (@eesnimi, @perenimi, @synniaeg, @Ryhm_ryhmId, @keskmine_hinne)" SelectCommand="SELECT * FROM [OpilaneSet]" UpdateCommand="UPDATE [OpilaneSet] SET [eesnimi] = @eesnimi, [perenimi] = @perenimi, [synniaeg] = @synniaeg, [Ryhm_ryhmId] = @Ryhm_ryhmId, [keskmine_hinne] = @keskmine_hinne WHERE [opilaneId] = @opilaneId">
        <DeleteParameters>
            <asp:Parameter Name="opilaneId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="eesnimi" Type="String" />
            <asp:Parameter Name="perenimi" Type="String" />
            <asp:Parameter DbType="Date" Name="synniaeg" />
            <asp:Parameter Name="Ryhm_ryhmId" Type="Int32" />
            <asp:Parameter Name="keskmine_hinne" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="eesnimi" Type="String" />
            <asp:Parameter Name="perenimi" Type="String" />
            <asp:Parameter DbType="Date" Name="synniaeg" />
            <asp:Parameter Name="Ryhm_ryhmId" Type="Int32" />
            <asp:Parameter Name="keskmine_hinne" Type="Decimal" />
            <asp:Parameter Name="opilaneId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
        
    </main>
</asp:Content>
