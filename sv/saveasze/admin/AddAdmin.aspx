<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddAdmin.aspx.cs" Inherits="saveasze.admin.AddAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .content-wrapper {
            position: relative;
            background-image: url(../dashboard/assets/images/dashboard-bg.png);
            background-repeat: no-repeat;
            background-size: cover;
            background-position: right bottom;
        }
        
        .content-wrapper .blue-button {
            position: absolute;
            top: 90%;
            margin-top: 15px;
        }
        .nav-pills, .tab-content {
     height: auto; 
    background: #FFFFFF;
    border-radius: 3px;
}
        
        tr:focus,
        tr:hover {
            background-color: #f2f2f2;
        }
        
        .blue-button svg {
            fill: white !important;
        }
        
        .modal-content .orange-bg {
            color: white;
        }
        
        .edit-button-modal {
            z-index: 100;
        }
        
        #statusContent {
            display: none;
        }
    </style>

    <script>
    </script>
    
    <section class="col-12 p-5">
                        <div class="row justify-content-center">
                            <div class="col-12 col-md-10 col-lg-10 pl-md-4 pr-md-4 pl-0 pr-0 mt-2">
                                <ul class="nav nav-pills nav-fill bg-white p-3" id="myTab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="createAdmin-tab" data-toggle="tab" href="#createAdmin" role="tab" aria-controls="createAdmin" aria-selected="true">Create Admin</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="manageAdmin-tab" data-toggle="tab" href="#manageAdmin" role="tab" aria-controls="manageAdmin" aria-selected="true">Manage Admin</a>
                                    </li>
                                </ul>
                                <div class="tab-content" id="myTabContent">
                                    <div class="tab-pane fade show active" id="createAdmin" role="tabpanel" aria-labelledby="createAdmin-tab">
                                        <div class="col-12 pl-2 pr-2 pt-3 pb-3 mx-auto mt-5">

                                            <form  class="col-md-12 col-lg-7 col-12 mx-auto bg-white pt-2 pb-2 pl-3 pr-3">
                                                <div class="row justify-content-center">
                                                     <asp:label runat="server" id="lblmes"></asp:label>
                                                    <div class="form-group col-10 mb-4 mt-3">
                                                        <label class="col-12 text-left">Select admin account level</label>
                                                        <select runat="server" id="adlevel">
                                                            <option selected>Select Status Level</option>
                                                            <option value="1">Status Level 2</option>
                                                            <option value="2">Status Level 3</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-10 mb-4">
                                                        <label for="text"  class="col-12 text-left">First Name</label>
                                                        <input type="text" runat="server" id="txtfname">
                                                    </div>
                                                    <div class="form-group col-10 mb-4">
                                                        <label for="text" class="col-12 text-left">Last Name</label>
                                                        <input type="text"  runat="server" id="txtlname" >
                                                    </div>
                                                     <div class="form-group col-10 mb-4">
                                                        <label for="text" class="col-12 text-left">Phone</label>
                                                        <input type="text"  runat="server" id="txtphone" >
                                                    </div>
                                                    <div class="form-group col-10 mb-4">
                                                        <label for="email" class="col-12 text-left">Email (Company Email)</label>
                                                        <input type="email"  runat="server" id="txtemail" >
                                                    </div>
                                                    <div class="form-group col-10 mb-4">
                                                        <label for="password"   class="col-12 text-left">Password</label>
                                                        <input type="password" runat="server" id="txtpword">
                                                    </div>
                                                      <div class="form-group col-10 mb-4">
                                                        <label for="password"   class="col-12 text-left"> confirm Password </label>
                                                        <input type="password" runat="server" id="txtpword2">
                                                    </div>
                                                    <div class="form-group col-10 mt-3">
                                                        <div class="row justify-content-center">
                                                            <asp:Button runat="server" ID="btnreg" CssClass="dashboard-modal-button btn col-6 orange-bg p-2" Text="Register Admin" OnClick="btnreg_Click" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="manageAdmin" role="tabpanel" aria-labelledby="manageAdmin-tab">
                                        <div class="col-12 pl-2 pr-2 pt-3 pb-3 mx-auto mt-5">

                                            <table class="table table-striped table-borderless table-responsive-sm">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">S/N</th>
                                                        <th scope="col">Admin ID</th>
                                                        <th scope="col">Full Name</th>
                                                        <th scope="col">Level</th>
                                                        <th scope="col">Status</th>
                                                        <th scope="col">Login Session</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <th scope="row">1</th>
                                                        <td class="table-modal-button">097654567</td>
                                                        <td class="table-modal-button">segun Agbenro</td>
                                                        <td class="table-modal-button">Level 3</td>
                                                        <td class="table-modal-button">Active</td>
                                                        <td class="table-modal-button">20/10/19 22:22</td>
                                                        <td class="edit-button-modal"><svg xmlns="http://www.w3.org/2000/svg" width="19" height="19" viewBox="0 0 19 19" fill="none"><style>.edit-button-modal{fill:black !important;}</style><g clip-path="url(#clip0)"><path d="M17.5 11.9C17.3 11.9 17.1 12.1 17.1 12.4V16.6C17.1 17.4 16.4 18 15.6 18H2.4C1.6 18 0.9 17.4 0.9 16.6V4.3C0.9 3.5 1.6 2.9 2.4 2.9H6.6C6.8 2.9 7 2.6 7 2.4 7 2.1 6.8 1.9 6.6 1.9H2.4C1.1 1.9 0 3 0 4.3V16.6C0 17.9 1.1 19 2.4 19H15.6C16.9 19 18 17.9 18 16.6V12.4C18 12.1 17.8 11.9 17.5 11.9Z" class="edit-button-modal"/><path d="M17.8 0.7C17-0.1 15.6-0.1 14.8 0.7L6.4 9.1C6.3 9.2 6.3 9.3 6.2 9.3L5.1 13.4C5.1 13.5 5.1 13.7 5.3 13.8 5.4 13.9 5.6 14 5.7 13.9L9.7 12.8C9.8 12.8 9.9 12.8 9.9 12.7L18.4 4.3C19.2 3.4 19.2 2.1 18.4 1.3L17.8 0.7ZM7.4 9.4L14.3 2.5 16.5 4.8 9.6 11.7 7.4 9.4ZM7 10.3L8.7 12.1 6.3 12.8 7 10.3ZM17.7 3.6L17.2 4.1 15 1.9 15.5 1.4C15.9 0.9 16.7 0.9 17.2 1.4L17.7 1.9C18.2 2.4 18.2 3.1 17.7 3.6Z" class="edit-button-modal"/></g><defs><clipPath><rect width="19" height="19" fill="white"/></clipPath></defs></svg></td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">2</th>
                                                        <td class="table-modal-button">097654567</td>
                                                        <td class="table-modal-button">segun Agbenro</td>
                                                        <td class="table-modal-button">Level 3</td>
                                                        <td class="table-modal-button">Active</td>
                                                        <td class="table-modal-button">20/10/19 22:22</td>
                                                        <td class="edit-button-modal"><svg xmlns="http://www.w3.org/2000/svg" width="19" height="19" viewBox="0 0 19 19" fill="none"><style>.edit-button-modal{fill:black !important;}</style><g clip-path="url(#clip0)"><path d="M17.5 11.9C17.3 11.9 17.1 12.1 17.1 12.4V16.6C17.1 17.4 16.4 18 15.6 18H2.4C1.6 18 0.9 17.4 0.9 16.6V4.3C0.9 3.5 1.6 2.9 2.4 2.9H6.6C6.8 2.9 7 2.6 7 2.4 7 2.1 6.8 1.9 6.6 1.9H2.4C1.1 1.9 0 3 0 4.3V16.6C0 17.9 1.1 19 2.4 19H15.6C16.9 19 18 17.9 18 16.6V12.4C18 12.1 17.8 11.9 17.5 11.9Z" class="edit-button-modal"/><path d="M17.8 0.7C17-0.1 15.6-0.1 14.8 0.7L6.4 9.1C6.3 9.2 6.3 9.3 6.2 9.3L5.1 13.4C5.1 13.5 5.1 13.7 5.3 13.8 5.4 13.9 5.6 14 5.7 13.9L9.7 12.8C9.8 12.8 9.9 12.8 9.9 12.7L18.4 4.3C19.2 3.4 19.2 2.1 18.4 1.3L17.8 0.7ZM7.4 9.4L14.3 2.5 16.5 4.8 9.6 11.7 7.4 9.4ZM7 10.3L8.7 12.1 6.3 12.8 7 10.3ZM17.7 3.6L17.2 4.1 15 1.9 15.5 1.4C15.9 0.9 16.7 0.9 17.2 1.4L17.7 1.9C18.2 2.4 18.2 3.1 17.7 3.6Z" class="edit-button-modal"/></g><defs><clipPath><rect width="19" height="19" fill="white"/></clipPath></defs></svg></td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">3</th>
                                                        <td class="table-modal-button">097654567</td>
                                                        <td class="table-modal-button">segun Agbenro</td>
                                                        <td class="table-modal-button">Level 3</td>
                                                        <td class="table-modal-button">Active</td>
                                                        <td class="table-modal-button">20/10/19 22:22</td>
                                                        <td class="edit-button-modal"><svg xmlns="http://www.w3.org/2000/svg" width="19" height="19" viewBox="0 0 19 19" fill="none"><style>.edit-button-modal{fill:black !important;}</style><g clip-path="url(#clip0)"><path d="M17.5 11.9C17.3 11.9 17.1 12.1 17.1 12.4V16.6C17.1 17.4 16.4 18 15.6 18H2.4C1.6 18 0.9 17.4 0.9 16.6V4.3C0.9 3.5 1.6 2.9 2.4 2.9H6.6C6.8 2.9 7 2.6 7 2.4 7 2.1 6.8 1.9 6.6 1.9H2.4C1.1 1.9 0 3 0 4.3V16.6C0 17.9 1.1 19 2.4 19H15.6C16.9 19 18 17.9 18 16.6V12.4C18 12.1 17.8 11.9 17.5 11.9Z" class="edit-button-modal"/><path d="M17.8 0.7C17-0.1 15.6-0.1 14.8 0.7L6.4 9.1C6.3 9.2 6.3 9.3 6.2 9.3L5.1 13.4C5.1 13.5 5.1 13.7 5.3 13.8 5.4 13.9 5.6 14 5.7 13.9L9.7 12.8C9.8 12.8 9.9 12.8 9.9 12.7L18.4 4.3C19.2 3.4 19.2 2.1 18.4 1.3L17.8 0.7ZM7.4 9.4L14.3 2.5 16.5 4.8 9.6 11.7 7.4 9.4ZM7 10.3L8.7 12.1 6.3 12.8 7 10.3ZM17.7 3.6L17.2 4.1 15 1.9 15.5 1.4C15.9 0.9 16.7 0.9 17.2 1.4L17.7 1.9C18.2 2.4 18.2 3.1 17.7 3.6Z" class="edit-button-modal"/></g><defs><clipPath><rect width="19" height="19" fill="white"/></clipPath></defs></svg></td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">4</th>
                                                        <td class="table-modal-button">097654567</td>
                                                        <td class="table-modal-button">segun Agbenro</td>
                                                        <td class="table-modal-button">Level 3</td>
                                                        <td class="table-modal-button">Active</td>
                                                        <td class="table-modal-button">20/10/19 22:22</td>
                                                        <td class="edit-button-modal"><svg xmlns="http://www.w3.org/2000/svg" width="19" height="19" viewBox="0 0 19 19" fill="none"><style>.edit-button-modal{fill:black !important;}</style><g clip-path="url(#clip0)"><path d="M17.5 11.9C17.3 11.9 17.1 12.1 17.1 12.4V16.6C17.1 17.4 16.4 18 15.6 18H2.4C1.6 18 0.9 17.4 0.9 16.6V4.3C0.9 3.5 1.6 2.9 2.4 2.9H6.6C6.8 2.9 7 2.6 7 2.4 7 2.1 6.8 1.9 6.6 1.9H2.4C1.1 1.9 0 3 0 4.3V16.6C0 17.9 1.1 19 2.4 19H15.6C16.9 19 18 17.9 18 16.6V12.4C18 12.1 17.8 11.9 17.5 11.9Z" class="edit-button-modal"/><path d="M17.8 0.7C17-0.1 15.6-0.1 14.8 0.7L6.4 9.1C6.3 9.2 6.3 9.3 6.2 9.3L5.1 13.4C5.1 13.5 5.1 13.7 5.3 13.8 5.4 13.9 5.6 14 5.7 13.9L9.7 12.8C9.8 12.8 9.9 12.8 9.9 12.7L18.4 4.3C19.2 3.4 19.2 2.1 18.4 1.3L17.8 0.7ZM7.4 9.4L14.3 2.5 16.5 4.8 9.6 11.7 7.4 9.4ZM7 10.3L8.7 12.1 6.3 12.8 7 10.3ZM17.7 3.6L17.2 4.1 15 1.9 15.5 1.4C15.9 0.9 16.7 0.9 17.2 1.4L17.7 1.9C18.2 2.4 18.2 3.1 17.7 3.6Z" class="edit-button-modal"/></g><defs><clipPath><rect width="19" height="19" fill="white"/></clipPath></defs></svg></td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">5</th>
                                                        <td class="table-modal-button">097654567</td>
                                                        <td class="table-modal-button">segun Agbenro</td>
                                                        <td class="table-modal-button">Level 3</td>
                                                        <td class="table-modal-button">Active</td>
                                                        <td class="table-modal-button">20/10/19 22:22</td>
                                                        <td class="edit-button-modal"><svg xmlns="http://www.w3.org/2000/svg" width="19" height="19" viewBox="0 0 19 19" fill="none"><style>.edit-button-modal{fill:black !important;}</style><g clip-path="url(#clip0)"><path d="M17.5 11.9C17.3 11.9 17.1 12.1 17.1 12.4V16.6C17.1 17.4 16.4 18 15.6 18H2.4C1.6 18 0.9 17.4 0.9 16.6V4.3C0.9 3.5 1.6 2.9 2.4 2.9H6.6C6.8 2.9 7 2.6 7 2.4 7 2.1 6.8 1.9 6.6 1.9H2.4C1.1 1.9 0 3 0 4.3V16.6C0 17.9 1.1 19 2.4 19H15.6C16.9 19 18 17.9 18 16.6V12.4C18 12.1 17.8 11.9 17.5 11.9Z" class="edit-button-modal"/><path d="M17.8 0.7C17-0.1 15.6-0.1 14.8 0.7L6.4 9.1C6.3 9.2 6.3 9.3 6.2 9.3L5.1 13.4C5.1 13.5 5.1 13.7 5.3 13.8 5.4 13.9 5.6 14 5.7 13.9L9.7 12.8C9.8 12.8 9.9 12.8 9.9 12.7L18.4 4.3C19.2 3.4 19.2 2.1 18.4 1.3L17.8 0.7ZM7.4 9.4L14.3 2.5 16.5 4.8 9.6 11.7 7.4 9.4ZM7 10.3L8.7 12.1 6.3 12.8 7 10.3ZM17.7 3.6L17.2 4.1 15 1.9 15.5 1.4C15.9 0.9 16.7 0.9 17.2 1.4L17.7 1.9C18.2 2.4 18.2 3.1 17.7 3.6Z" class="edit-button-modal"/></g><defs><clipPath><rect width="19" height="19" fill="white"/></clipPath></defs></svg></td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">6</th>
                                                        <td class="table-modal-button">097654567</td>
                                                        <td class="table-modal-button">segun Agbenro</td>
                                                        <td class="table-modal-button">Level 3</td>
                                                        <td class="table-modal-button">Active</td>
                                                        <td class="table-modal-button">20/10/19 22:22</td>
                                                        <td class="edit-button-modal"><svg xmlns="http://www.w3.org/2000/svg" width="19" height="19" viewBox="0 0 19 19" fill="none"><style>.edit-button-modal{fill:black !important;}</style><g clip-path="url(#clip0)"><path d="M17.5 11.9C17.3 11.9 17.1 12.1 17.1 12.4V16.6C17.1 17.4 16.4 18 15.6 18H2.4C1.6 18 0.9 17.4 0.9 16.6V4.3C0.9 3.5 1.6 2.9 2.4 2.9H6.6C6.8 2.9 7 2.6 7 2.4 7 2.1 6.8 1.9 6.6 1.9H2.4C1.1 1.9 0 3 0 4.3V16.6C0 17.9 1.1 19 2.4 19H15.6C16.9 19 18 17.9 18 16.6V12.4C18 12.1 17.8 11.9 17.5 11.9Z" class="edit-button-modal"/><path d="M17.8 0.7C17-0.1 15.6-0.1 14.8 0.7L6.4 9.1C6.3 9.2 6.3 9.3 6.2 9.3L5.1 13.4C5.1 13.5 5.1 13.7 5.3 13.8 5.4 13.9 5.6 14 5.7 13.9L9.7 12.8C9.8 12.8 9.9 12.8 9.9 12.7L18.4 4.3C19.2 3.4 19.2 2.1 18.4 1.3L17.8 0.7ZM7.4 9.4L14.3 2.5 16.5 4.8 9.6 11.7 7.4 9.4ZM7 10.3L8.7 12.1 6.3 12.8 7 10.3ZM17.7 3.6L17.2 4.1 15 1.9 15.5 1.4C15.9 0.9 16.7 0.9 17.2 1.4L17.7 1.9C18.2 2.4 18.2 3.1 17.7 3.6Z" class="edit-button-modal"/></g><defs><clipPath><rect width="19" height="19" fill="white"/></clipPath></defs></svg></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </section>


     <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/slick.min.js"></script>
    <script src="../assets/js/popper.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
    <script src="assets/js/chartjs.js"></script>
    <script src="assets/js/main.js"></script>
    <script>
        {
            /* Table Modal */
            const tableModalButton = document.querySelectorAll('.table-modal-button');
            const closeTableModal = document.querySelector('.close-transaction-modal');
            tableModalButton.forEach(tableHead => tableHead.addEventListener('click', () => {
                document.querySelector('.transaction-modal').style.display = 'block';
            }))
            closeTableModal.addEventListener('click', () => {
                document.querySelector('.transaction-modal').style.display = 'none';
            })

            window.addEventListener('click', (event) => {
                if (event.target == document.querySelector('.transaction-modal')) {
                    document.querySelector('.transaction-modal').style.display = 'none';
                }
            });
            /* Table Modal */
        }

        {
            /* Table Modal */
            const editModalButton = document.querySelectorAll('.edit-button-modal');
            const closeTableModal = document.querySelector('.close-dashboard-modal');
            editModalButton.forEach(edit => edit.addEventListener('click', () => {
                document.querySelector('.dashboard-modal').style.display = 'block';
            }))
            closeTableModal.addEventListener('click', () => {
                document.querySelector('.dashboard-modal').style.display = 'none';
            })

            window.addEventListener('click', (event) => {
                if (event.target == document.querySelector('.dashboard-modal')) {
                    document.querySelector('.dashboard-modal').style.display = 'none';
                }
            });
            /* Table Modal */
        }
    </script>
</asp:Content>
