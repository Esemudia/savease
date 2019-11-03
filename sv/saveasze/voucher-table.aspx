<%@ Page Title="" Language="C#" MasterPageFile="~/saveaze_no_cfooter1.Master" AutoEventWireup="true" CodeBehind="voucher-table.aspx.cs" Inherits="saveasze.voucher_table" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <style>
        .content-wrapper {
            position: relative;
            background-image: url(assets/images/dashboard-bg.png);
            background-repeat: no-repeat;
            background-size: cover;
            background-position: right bottom;
        }
        
        .content-wrapper .blue-button {
            position: absolute;
            top: 90%;
            margin-top: 15px;
        }
        
        .blue-button svg {
            fill: white !important;
        }
    </style>
     <section class="col-12 p-5">
                        <div class="row justify-content-center">
                            <div class="col-12 col-md-10 col-lg-10 pl-md-4 pr-md-4 pl-0 pr-0 mt-2">
                                <ul class="nav nav-pills nav-fill bg-white p-3" id="myTab" role="tablist">
                                    <li class="nav-item">
                                        <asp:LinkButton runat="server" class="nav-link " id="usedtab" OnClick="usedtab_Click" Text="Used" ></asp:LinkButton>
                                    </li>
                                    <li class="nav-item">
                                        <asp:LinkButton runat="server" class="nav-link" id="unUsedtab" OnClick="unUsedtab_Click" Text="Unused"></asp:LinkButton>
                                    </li>
                                </ul>
                                <div class="tab-content" id="myTabContent">
                                    <div class="" id="used" visible="true" runat="server" role="tabpanel" aria-labelledby="used-tab">
                                        <div class="col-12 pl-2 pr-2 pt-3 pb-3 mx-auto mt-5">
                                            <h5 class="col-12 text-center mb-5">
                                               
                                            </h5>
                                            <asp:GridView CssClass="table table-striped table-borderless table-responsive-sm" PageSize="10" OnPageIndexChanging="Gridusedpin_PageIndexChanging" runat="server" ID="Gridusedpin" AllowSorting="true"  AllowPaging="true" >
                                                
                                               
                                            </asp:GridView>
                                        </div>
                                    </div>
                                    <div class="" id="unUsed" visible="false" runat="server" role="tabpanel" aria-labelledby="unUsed-tab">
                                        <div class="col-12 pl-2 pr-2 pt-3 pb-3 mx-auto mt-5">
                                            <h5 class="col-12 text-center mb-5">
                                              
                                            </h5>
                                            <asp:GridView CssClass="table table-striped table-borderless table-responsive-sm" PageSize="20" OnPageIndexChanging="GridView1_PageIndexChanging" runat="server" ID="GridView1"  AllowPaging="true" >
                                                
                                               
                                            </asp:GridView>
                                       
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="row justify-content-start align-items-end">
                            <a href="#" class="blue-button">
                                <img src="assets/images/information.png" class="mr-2" alt="" width="25" height="25"> Help
                            </a>
                        </div>
                        <div class="row justify-content-end align-items-end">
                            <a href="#" class="blue-button">
                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 40 40"><g clip-path="url(#clip0)"><path d="M37.2 8.5H29.7V4.2C29.7 3.8 29.3 3.4 28.9 3.4H11.1C10.7 3.4 10.3 3.8 10.3 4.2V8.5H2.8C1.3 8.5 0 9.7 0 11.3V24.8C0 26.3 1.3 27.6 2.8 27.6H10.3V35.8C10.3 36.2 10.7 36.6 11.1 36.6H28.9C29.3 36.6 29.7 36.2 29.7 35.8V27.6H37.2C38.7 27.6 40 26.3 40 24.8V11.3C40 9.7 38.7 8.5 37.2 8.5ZM29.7 10.2H31.7V12.5H29.7V10.2ZM12 5.1H28V12.5H12V5.1ZM8.3 10.2H10.3V12.5H8.3V10.2ZM28 34.9H12V23.7H28V34.9H28ZM38.3 24.8H38.3C38.3 25.4 37.8 25.9 37.2 25.9H29.7V23.7H31.3C31.7 23.7 32.1 23.4 32.1 22.9 32.1 22.4 31.7 22 31.3 22H28.9 11.1 8.7C8.3 22 7.9 22.4 7.9 22.9 7.9 23.4 8.3 23.7 8.7 23.7H10.3V25.9H2.8C2.2 25.9 1.7 25.4 1.7 24.8V11.3C1.7 10.7 2.2 10.2 2.8 10.2H6.6V13.4C6.6 13.8 6.9 14.2 7.4 14.2H32.6C33.1 14.2 33.4 13.8 33.4 13.4V10.2H37.2C37.8 10.2 38.3 10.7 38.3 11.3V24.8Z"/><path d="M5.4 18.2C6 18.2 6.4 17.7 6.4 17.1 6.4 16.5 6 16.1 5.4 16.1 4.8 16.1 4.3 16.5 4.3 17.1 4.3 17.7 4.8 18.2 5.4 18.2Z"/><path d="M19.8 30.2H15.8C15.3 30.2 14.9 30.6 14.9 31 14.9 31.5 15.3 31.9 15.8 31.9H19.8C20.2 31.9 20.6 31.5 20.6 31 20.6 30.6 20.2 30.2 19.8 30.2Z"/><path d="M24.2 25.9H15.8C15.3 25.9 14.9 26.3 14.9 26.7 14.9 27.2 15.3 27.6 15.8 27.6H24.2C24.7 27.6 25.1 27.2 25.1 26.7 25.1 26.3 24.7 25.9 24.2 25.9Z"/></g><defs><clipPath><rect width="40" height="40" fill="white"/></clipPath></defs></svg>                                Print
                            </a>
                        </div>
                    </section>
</asp:Content>
