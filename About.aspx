<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="ADO.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>.<asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="opilaneId" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
            <Columns>
                <asp:BoundField DataField="opilaneId" HeaderText="opilaneId" InsertVisible="False" ReadOnly="True" SortExpression="opilaneId" />
                <asp:BoundField DataField="eesnimi" HeaderText="eesnimi" SortExpression="eesnimi" />
                <asp:BoundField DataField="perenimi" HeaderText="perenimi" SortExpression="perenimi" />
                <asp:BoundField DataField="synniaeg" HeaderText="synniaeg" SortExpression="synniaeg" />
                <asp:BoundField DataField="keskmine_hinne" HeaderText="keskmine_hinne" SortExpression="keskmine_hinne" />
                <asp:BoundField DataField="ryhmNimi" HeaderText="ryhmNimi" SortExpression="ryhmNimi" />
                <asp:BoundField DataField="osakond" HeaderText="osakond" SortExpression="osakond" />
            </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:kutsekool_DenisenkoConnectionString2 %>" DeleteCommand="DELETE FROM [OpilaneSet] WHERE [opilaneId] = @opilaneId" InsertCommand="INSERT INTO [OpilaneSet] ([eesnimi], [perenimi], [synniaeg], [Ryhm_ryhmId], [keskmine_hinne]) VALUES (@eesnimi, @perenimi, @synniaeg, @Ryhm_ryhmId, @keskmine_hinne)" SelectCommand="SELECT OpilaneSet.opilaneId, OpilaneSet.eesnimi, OpilaneSet.perenimi, OpilaneSet.synniaeg, OpilaneSet.keskmine_hinne, RyhmSet.ryhmNimi, RyhmSet.osakond FROM OpilaneSet INNER JOIN RyhmSet ON OpilaneSet.Ryhm_ryhmId = RyhmSet.ryhmId" UpdateCommand="UPDATE [OpilaneSet] SET [eesnimi] = @eesnimi, [perenimi] = @perenimi, [synniaeg] = @synniaeg, [Ryhm_ryhmId] = @Ryhm_ryhmId, [keskmine_hinne] = @keskmine_hinne WHERE [opilaneId] = @opilaneId">
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
    </h2>
        <h3>Õpilased seisuga 04.03.2024</h3>
        <p>&nbsp;</p>
    </main>
</asp:Content>
