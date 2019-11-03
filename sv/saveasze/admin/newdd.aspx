<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.Master" AutoEventWireup="true" CodeBehind="newdd.aspx.cs" Inherits="saveasze.admin.newdd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <style>
        .form-group input {
            background: #FFFFFF;
            border: 0.5px solid #607D8B;
            box-sizing: border-box;
            border-radius: 4px;
            height: unset;
            outline: unset !important;
        }
    </style>
     <section class="col-12 p-5">
                        <div class="row justify-content-center">
                            <div class="col-12 col-md-6 col-lg-3 pl-md-2 pr-md-2 pl-0 pr-0 mb-2">
                                <div class="summary--index--card col-12 pl-0 pr-0 pt-3 pb-1">
                                    <div class="summary--card-head">
                                        <h5 class="col-12 text-left">
                                            Total User
                                        </h5>
                                    </div>
                                    <div class="summary--card-body pt-3 pb-3">
                                        <h2 class="col-12">250K</h2>
                                    </div>
                                    <div class="summary--card-footer">
                                        <p class="col-12">
                                            Last Month:
                                            <span class="ml-5">
                                                <svg width="13" height="12" viewBox="0 0 13 12" xmlns="http://www.w3.org/2000/svg" fill="none"><path d="M6.5 0L13 11.3H0L6.5 0Z" fill="#55CD6C"/></svg>
                                                2.5%
                                            </span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-md-6 col-lg-3 pl-md-2 pr-md-2 pl-0 pr-0 mb-2">
                                <div class="summary--index--card col-12 pl-0 pr-0 pt-3 pb-1">
                                    <div class="summary--card-head">
                                        <h5 class="col-12 text-left">
                                            Active User
                                        </h5>
                                    </div>
                                    <div class="summary--card-body pt-3 pb-3">
                                        <h2 class="col-12">50K</h2>
                                    </div>
                                    <div class="summary--card-footer">
                                        <p class="col-12">
                                            Last Month:
                                            <span class="ml-5">
                                                <svg width="13" height="12" viewBox="0 0 13 12" xmlns="http://www.w3.org/2000/svg" fill="none"><path d="M6.5 0L13 11.3H0L6.5 0Z" fill="#55CD6C"/></svg>
                                                2.5%
                                            </span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-md-6 col-lg-3 pl-md-2 pr-md-2 pl-0 pr-0 mb-2">
                                <div class="summary--index--card col-12 pl-0 pr-0 pt-3 pb-1">
                                    <div class="summary--card-head">
                                        <h5 class="col-12 text-left">
                                            Total Transfer
                                        </h5>
                                    </div>
                                    <div class="summary--card-body pt-3 pb-3">
                                        <h2 class="col-12">$250K</h2>
                                    </div>
                                    <div class="summary--card-footer">
                                        <p class="col-12">
                                            Last Month:
                                            <span class="ml-5">
                                                <svg width="13" height="12" viewBox="0 0 13 12" xmlns="http://www.w3.org/2000/svg" fill="none"><path d="M6.5 0L13 11.3H0L6.5 0Z" fill="#55CD6C"/></svg>
                                                2.5%
                                            </span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-md-6 col-lg-3 pl-md-2 pr-md-2 pl-0 pr-0 mb-2">
                                <div class="summary--index--card col-12 pl-0 pr-0 pt-3 pb-1">
                                    <div class="summary--card-head">
                                        <h5 class="col-12 text-left">
                                            Total Deposit
                                        </h5>
                                    </div>
                                    <div class="summary--card-body pt-3 pb-3">
                                        <h2 class="col-12">$250K</h2>
                                    </div>
                                    <div class="summary--card-footer">
                                        <p class="col-12">
                                            Last Month:
                                            <span class="ml-5">
                                                <svg width="13" height="12" viewBox="0 0 13 12" xmlns="http://www.w3.org/2000/svg" fill="none"><path d="M6.5 0L13 11.3H0L6.5 0Z" fill="#55CD6C"/></svg>
                                                2.5%
                                            </span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 mt-5">
                                <div class="row">
                                    <div class="col-12 col-md-6 col-lg-3 pl-md-2 pr-md-2 pl-0 pr-0 mb-2">
                                        <div class="summary--index--card col-12 pl-0 pr-0 pt-3 pb-1">
                                            <div class="summary--card-head">
                                                <h5 class="col-12 text-left">
                                                    Total Card Used
                                                </h5>
                                            </div>
                                            <div class="summary--card-body pt-2 pb-2">
                                                <h2 class="col-12">$250K</h2>
                                                <p class="col-12">Amount: 300k</p>
                                            </div>
                                            <div class="summary--card-footer">
                                                <p class="col-12">
                                                    Last Month:
                                                    <span class="ml-5">
                                                                <svg width="13" height="12" viewBox="0 0 13 12" xmlns="http://www.w3.org/2000/svg" fill="none"><path d="M6.5 0L13 11.3H0L6.5 0Z" fill="#55CD6C"/></svg>
                                                                2.5%
                                                            </span>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-6 col-lg-3 pl-md-2 pr-md-2 pl-0 pr-0 mb-2">
                                        <div class="summary--index--card col-12 pl-0 pr-0 pt-3 pb-1">
                                            <div class="summary--card-head">
                                                <h5 class="col-12 text-left">
                                                    Total Withdraw
                                                </h5>
                                            </div>
                                            <div class="summary--card-body pt-3 pb-3">
                                                <h2 class="col-12">$50k</h2>
                                            </div>
                                            <div class="summary--card-footer">
                                                <p class="col-12">
                                                    Last Month:
                                                    <span class="ml-5">
                                                                <svg width="13" height="12" viewBox="0 0 13 12" xmlns="http://www.w3.org/2000/svg" fill="none"><path d="M6.5 0L13 11.3H0L6.5 0Z" fill="#55CD6C"/></svg>
                                                                2.5%
                                                            </span>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-6 col-lg-3 pl-md-2 pr-md-2 pl-0 pr-0 mb-2">
                                        <div class="summary--index--card col-12 pl-0 pr-0 pt-3 pb-1">
                                            <div class="summary--card-head">
                                                <h5 class="col-12 text-left">
                                                    Commission
                                                </h5>
                                            </div>
                                            <div class="summary--card-body pt-3 pb-3">
                                                <h2 class="col-12">$250K</h2>
                                            </div>
                                            <div class="summary--card-footer">
                                                <p class="col-12">
                                                    Last Month:
                                                    <span class="ml-5">
                                                                <svg width="13" height="12" viewBox="0 0 13 12" xmlns="http://www.w3.org/2000/svg" fill="none"><path d="M6.5 0L13 11.3H0L6.5 0Z" fill="#55CD6C"/></svg>
                                                                2.5%
                                                            </span>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-md-12 col-lg-8 bg-white mt-5 pt-2 pl-3 pr-5">
                                <div class="row justify-content-center">
                                    <canvas id="userChart" width="400" height="400"></canvas>
                                </div>
                                <div class="row justify-content-start mt-2">
                                    <div class="col-12 col-md-12 col-lg-6 mb-2">
                                        <button class="summary--btn btn m-1">Hours</button>
                                        <button class="summary--btn btn m-1">Days</button>
                                        <button class="summary--btn btn m-1">Months</button>
                                        <button class="summary--btn btn m-1">Years</button>
                                    </div>
                                    <div class="col-12 col-md-12 col-lg-6 mb-2">
                                        <form action="" class="row">
                                            <div class="form-group col-lg-5 col-md-5 m-0">
                                                <input type="date" class="form-control col-12 p-0 pl-1">
                                            </div>
                                            <div class="form-group col-lg-5 col-md-5 m-0">
                                                <input type="date" class="form-control col-12 p-0 pl-1">
                                            </div>
                                            <button class="date-btn btn">
                                                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path d="M19.0013 1.33333H16.668V0.333333C16.668 0.149 16.519 0 16.3346 0H14.0013C13.817 0 13.668 0.149 13.668 0.333333V1.33333H6.33464V0.333333C6.33464 0.149 6.18564 0 6.0013 0H3.66797C3.48364 0 3.33464 0.149 3.33464 0.333333V1.33333H1.0013C0.816969 1.33333 0.667969 1.48233 0.667969 1.66667V5.33333V19.6667C0.667969 19.851 0.816969 20 1.0013 20H19.0013C19.1856 20 19.3346 19.851 19.3346 19.6667V5.33333V1.66667C19.3346 1.48233 19.1856 1.33333 19.0013 1.33333ZM14.3346 0.666667H16.0013V1.66667V2.66667H14.3346V1.66667V0.666667ZM4.0013 0.666667H5.66797V1.66667V2.66667H4.0013V1.66667V0.666667ZM1.33464 2H3.33464V3C3.33464 3.18433 3.48364 3.33333 3.66797 3.33333H6.0013C6.18564 3.33333 6.33464 3.18433 6.33464 3V2H13.668V3C13.668 3.18433 13.817 3.33333 14.0013 3.33333H16.3346C16.519 3.33333 16.668 3.18433 16.668 3V2H18.668V5H1.33464V2ZM1.33464 19.3333V5.66667H18.668V19.3333H1.33464Z" fill="black"/>
                                                        <path d="M12.668 7.66699H10.3346H9.66797H7.33464H6.66797H3.66797V10.667V11.3337V13.667V14.3337V17.3337H6.66797H7.33464H9.66797H10.3346H12.668H13.3346H16.3346V14.3337V13.667V11.3337V10.667V7.66699H13.3346H12.668ZM10.3346 8.33366H12.668V10.667H10.3346V8.33366ZM12.668 13.667H10.3346V11.3337H12.668V13.667ZM7.33464 11.3337H9.66797V13.667H7.33464V11.3337ZM7.33464 8.33366H9.66797V10.667H7.33464V8.33366ZM4.33464 8.33366H6.66797V10.667H4.33464V8.33366ZM4.33464 11.3337H6.66797V13.667H4.33464V11.3337ZM6.66797 16.667H4.33464V14.3337H6.66797V16.667ZM9.66797 16.667H7.33464V14.3337H9.66797V16.667ZM12.668 16.667H10.3346V14.3337H12.668V16.667ZM15.668 16.667H13.3346V14.3337H15.668V16.667ZM15.668 13.667H13.3346V11.3337H15.668V13.667ZM15.668 8.33366V10.667H13.3346V8.33366H15.668Z" fill="black"/>
                                                        </svg>                                                        
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-md-12 col-lg-4 pl-md-2 pr-md-2 pl-0 pr-0 mt-5">
                                <div class="summary--index--card col-12 pl-0 pr-0 pt-3 pb-1">
                                    <div class="summary--card-head" style="border-bottom: 0.5px solid #C4C4C4;">
                                        <h6 class="col-12 text-left">
                                            User By Devices
                                        </h6>
                                    </div>
                                    <div class="summary--card-body pt-3 pb-3" style="border-bottom: 0.5px solid #C4C4C4;">
                                        <div class="col-12 mb-5">
                                            <canvas id="doughnutChart" width="200" height="200"></canvas>
                                        </div>
                                        <div class="col-12">
                                            <div class="row justify-content-center">
                                                <div class="col-4 text-center">
                                                    <div class="col-12">
                                                        <svg width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                                <path d="M17.5 1.5H12.5C12.224 1.5 12 1.724 12 1.99998C12 2.27596 12.224 2.49996 12.5 2.49996H17.5C17.7759 2.49996 17.9999 2.27596 17.9999 1.99998C17.9999 1.724 17.7759 1.5 17.5 1.5Z" fill="#607D8B"/>
                                                                <path d="M21 1.5H20.5C20.224 1.5 20 1.724 20 1.99998C20 2.27596 20.224 2.49996 20.5 2.49996H21C21.2759 2.49996 21.4999 2.27596 21.4999 1.99998C21.4999 1.724 21.2759 1.5 21 1.5Z" fill="#607D8B"/>
                                                                <path d="M15.621 25.5H14.3795C13.619 25.5 13 26.119 13 26.8795V27.121C13 27.8815 13.619 28.5 14.379 28.5H15.6205C16.381 28.5 17 27.8815 17 27.121V26.8795C17 26.119 16.381 25.5 15.621 25.5ZM16 27.121C16 27.33 15.83 27.5 15.621 27.5H14.3795C14.17 27.5 14 27.33 14 27.121V26.8795C14 26.67 14.1699 26.5 14.3795 26.5H15.6205C15.83 26.5 16 26.6699 16 26.8795V27.121Z" fill="#607D8B"/>
                                                                <path d="M21.693 0H8.3075C7.311 0 6.5 0.810996 6.5 1.8075V28.1925C6.5 29.189 7.311 30 8.3075 30H21.6925C22.689 30 23.5 29.189 23.5 28.193V1.8075C23.5 0.810996 22.689 0 21.693 0ZM22.5 28.1925C22.5 28.6375 22.138 29 21.693 29H8.3075C7.86201 29 7.50002 28.6375 7.50002 28.193V1.8075C7.50002 1.36248 7.86201 1.00002 8.3075 1.00002H21.6925C22.138 1.00002 22.5 1.36254 22.5 1.8075V28.1925H22.5Z" fill="#607D8B"/>
                                                                <path d="M22.9999 3H6.99998C6.724 3 6.5 3.224 6.5 3.49998V24.5C6.5 24.776 6.724 25 6.99998 25H23C23.276 25 23.5 24.776 23.5 24.5V3.49998C23.5 3.224 23.276 3 22.9999 3ZM22.5 24H7.49996V4.00002H22.5V24Z" fill="#607D8B"/>
                                                                </svg>
                                                    </div>
                                                    <div class="col-12">Desktop<br>2.5%</div>
                                                </div>
                                                <div class="col-4 text-center">
                                                    <div class="col-12">
                                                        <svg width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                                <path d="M17.5 1.5H12.5C12.224 1.5 12 1.724 12 1.99998C12 2.27596 12.224 2.49996 12.5 2.49996H17.5C17.7759 2.49996 17.9999 2.27596 17.9999 1.99998C17.9999 1.724 17.7759 1.5 17.5 1.5Z" fill="#607D8B"/>
                                                                <path d="M21 1.5H20.5C20.224 1.5 20 1.724 20 1.99998C20 2.27596 20.224 2.49996 20.5 2.49996H21C21.2759 2.49996 21.4999 2.27596 21.4999 1.99998C21.4999 1.724 21.2759 1.5 21 1.5Z" fill="#607D8B"/>
                                                                <path d="M15.621 25.5H14.3795C13.619 25.5 13 26.119 13 26.8795V27.121C13 27.8815 13.619 28.5 14.379 28.5H15.6205C16.381 28.5 17 27.8815 17 27.121V26.8795C17 26.119 16.381 25.5 15.621 25.5ZM16 27.121C16 27.33 15.83 27.5 15.621 27.5H14.3795C14.17 27.5 14 27.33 14 27.121V26.8795C14 26.67 14.1699 26.5 14.3795 26.5H15.6205C15.83 26.5 16 26.6699 16 26.8795V27.121Z" fill="#607D8B"/>
                                                                <path d="M21.693 0H8.3075C7.311 0 6.5 0.810996 6.5 1.8075V28.1925C6.5 29.189 7.311 30 8.3075 30H21.6925C22.689 30 23.5 29.189 23.5 28.193V1.8075C23.5 0.810996 22.689 0 21.693 0ZM22.5 28.1925C22.5 28.6375 22.138 29 21.693 29H8.3075C7.86201 29 7.50002 28.6375 7.50002 28.193V1.8075C7.50002 1.36248 7.86201 1.00002 8.3075 1.00002H21.6925C22.138 1.00002 22.5 1.36254 22.5 1.8075V28.1925H22.5Z" fill="#607D8B"/>
                                                                <path d="M22.9999 3H6.99998C6.724 3 6.5 3.224 6.5 3.49998V24.5C6.5 24.776 6.724 25 6.99998 25H23C23.276 25 23.5 24.776 23.5 24.5V3.49998C23.5 3.224 23.276 3 22.9999 3ZM22.5 24H7.49996V4.00002H22.5V24Z" fill="#607D8B"/>
                                                                </svg>
                                                    </div>
                                                    <div class="col-12">Mobile<br>2.5%</div>
                                                </div>
                                                <div class="col-4 text-center">
                                                    <div class="col-12">
                                                        <svg width="30" height="30" viewBox="0 0 35 35" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                                <g clip-path="url(#clip0)">
                                                                <path d="M25.0422 0H9.43822C8.13822 0 7.07422 1.063 7.07422 2.364V9.847V24.636V32.119C7.07422 33.42 8.13822 34.482 9.43822 34.482H25.0422C26.3422 34.482 27.4062 33.42 27.4062 32.119V24.636V9.847V2.364C27.4062 1.063 26.3422 0 25.0422 0ZM12.8032 31.76H10.2552C9.78622 31.76 9.40522 31.38 9.40522 30.911C9.40522 30.441 9.78622 30.06 10.2552 30.06H12.8032C13.2722 30.06 13.6532 30.441 13.6532 30.911C13.6532 31.38 13.2722 31.76 12.8032 31.76ZM12.8032 28.52H10.2552C9.78622 28.52 9.40522 28.139 9.40522 27.67C9.40522 27.201 9.78622 26.82 10.2552 26.82H12.8032C13.2722 26.82 13.6532 27.201 13.6532 27.67C13.6532 28.139 13.2722 28.52 12.8032 28.52ZM12.8032 25.28H10.2552C9.78622 25.28 9.40522 24.9 9.40522 24.431C9.40522 23.96 9.78622 23.58 10.2552 23.58H12.8032C13.2722 23.58 13.6532 23.96 13.6532 24.431C13.6532 24.9 13.2722 25.28 12.8032 25.28ZM12.8032 22.041H10.2552C9.78622 22.041 9.40522 21.66 9.40522 21.191C9.40522 20.722 9.78622 20.34 10.2552 20.34H12.8032C13.2722 20.34 13.6532 20.722 13.6532 21.191C13.6532 21.66 13.2722 22.041 12.8032 22.041ZM18.5142 31.76H15.9672C15.4972 31.76 15.1172 31.38 15.1172 30.911C15.1172 30.441 15.4972 30.06 15.9672 30.06H18.5142C18.9842 30.06 19.3642 30.441 19.3642 30.911C19.3632 31.38 18.9832 31.76 18.5142 31.76ZM18.5142 28.52H15.9672C15.4972 28.52 15.1172 28.139 15.1172 27.67C15.1172 27.201 15.4972 26.82 15.9672 26.82H18.5142C18.9842 26.82 19.3642 27.201 19.3642 27.67C19.3642 28.139 18.9832 28.52 18.5142 28.52ZM18.5142 25.28H15.9672C15.4972 25.28 15.1172 24.9 15.1172 24.431C15.1172 23.96 15.4972 23.58 15.9672 23.58H18.5142C18.9842 23.58 19.3642 23.96 19.3642 24.431C19.3632 24.9 18.9832 25.28 18.5142 25.28ZM18.5142 22.041H15.9672C15.4972 22.041 15.1172 21.66 15.1172 21.191C15.1172 20.722 15.4972 20.34 15.9672 20.34H18.5142C18.9842 20.34 19.3642 20.722 19.3642 21.191C19.3642 21.66 18.9832 22.041 18.5142 22.041ZM24.2252 31.76H21.6762C21.2072 31.76 20.8262 31.38 20.8262 30.911C20.8262 30.441 21.2072 30.06 21.6762 30.06H24.2252C24.6942 30.06 25.0752 30.441 25.0752 30.911C25.0742 31.38 24.6932 31.76 24.2252 31.76ZM24.2252 28.52H21.6762C21.2072 28.52 20.8262 28.139 20.8262 27.67C20.8262 27.201 21.2072 26.82 21.6762 26.82H24.2252C24.6942 26.82 25.0752 27.201 25.0752 27.67C25.0752 28.139 24.6932 28.52 24.2252 28.52ZM24.2252 25.28H21.6762C21.2072 25.28 20.8262 24.9 20.8262 24.431C20.8262 23.96 21.2072 23.58 21.6762 23.58H24.2252C24.6942 23.58 25.0752 23.96 25.0752 24.431C25.0742 24.9 24.6932 25.28 24.2252 25.28ZM24.2252 22.041H21.6762C21.2072 22.041 20.8262 21.66 20.8262 21.191C20.8262 20.722 21.2072 20.34 21.6762 20.34H24.2252C24.6942 20.34 25.0752 20.722 25.0752 21.191C25.0752 21.66 24.6932 22.041 24.2252 22.041ZM25.1252 18.38H9.35522V2.771H25.1252V18.38Z" fill="#607D8B"/>
                                                                </g>
                                                                <defs>
                                                                <clipPath id="clip0">
                                                                <rect width="34.482" height="34.482" fill="white"/>
                                                                </clipPath>
                                                                </defs>
                                                                </svg>
                                                    </div>
                                                    <div class="col-12">USSD<br>2.5%</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="summary--card-footer mt-2 mb-1">
                                        <form action="">
                                            <div class="col-12">
                                                <select name="" id="" class="form-control col-6">
                                                    <option value="">Last Week</option>
                                                    <option value="">Last Week</option>
                                                    <option value="">Last Week</option>
                                                    <option value="">Last Week</option>
                                                </select>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/slick.min.js"></script>
    <script src="../assets/js/popper.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
    <script src="../dashboard/assets/js/chartjs.js"></script>
    <script src="assets/js/main.js"></script>
    <script>
        {
            const userLineChart = document.querySelector('#userChart');
            let options = {
                maintainAspectRatio: false,
                scales: {
                    yAxes: [{
                        stacked: true,
                        gridLines: {
                            display: true,
                            color: "rgba(255,99,132,0.2)"
                        }
                    }],
                    xAxes: [{
                        gridLines: {
                            display: false
                        }
                    }]
                }
            };
            let lineChart = new Chart(userLineChart, {
                type: 'bar',
                data: {
                    labels: ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'],
                    datasets: [{
                        label: 'Transaction Summary',
                        data: [12000, 19000, 3000, 5000, 2000, 3000, 25000],
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(255, 159, 64, 0.2)'
                        ],
                        borderColor: [
                            'rgba(255, 99, 132, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(255, 159, 64, 1)'
                        ],
                        borderWidth: 1
                    }]
                },
                options: options
            });
            // var myBarChart = new Chart(ctx, {
            //     type: 'bar',
            //     data: data,
            //     options: options
            // });
        }

        {
            const adminDoughnutChart = document.querySelector('#doughnutChart');
            let options = {
                maintainAspectRatio: false,
                // scales: {
                //     yAxes: [{
                //         stacked: true,
                //         gridLines: {
                //             display: false
                //         }
                //     }],
                //     xAxes: [{
                //         gridLines: {
                //             display: false
                //         }
                //     }]
                // }
            };
            let roundChart = new Chart(adminDoughnutChart, {
                type: 'doughnut',
                data: {
                    //labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
                    datasets: [{
                        label: '# of Votes',
                        data: [12, 19, 3, 5, 2, 3],
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(255, 159, 64, 0.2)'
                        ],
                        borderColor: [
                            'rgba(255, 99, 132, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(255, 159, 64, 1)'
                        ],
                        borderWidth: 1
                    }]
                },
                options: options
            });
        }
    </script>
</asp:Content>
