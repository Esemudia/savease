<%@ Page Title="" Language="C#" MasterPageFile="~/userdash/userdash.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="saveasze.dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="content-wrapper">
            <div class="col-12">
                <div class="row">
                    <nav class="navbar navbar-expand-lg navbar-light w-100">
                        <span class="navButton">
                            <svg xmlns="http://www.w3.org/2000/svg" width="27" height="27" viewBox="0 0 37 37" fill="none"><path d="M1.4 9.4H35.6C36.4 9.4 37 8.8 37 8 37 7.3 36.4 6.6 35.6 6.6H1.4C0.6 6.6 0 7.3 0 8 0 8.8 0.6 9.4 1.4 9.4Z" class="side-nav-img mr-5"/><path d="M1.1 20.2H26.9C27.5 20.2 27.9 19.6 27.9 18.8 27.9 18.1 27.5 17.5 26.9 17.5H1.1C0.5 17.5 0 18.1 0 18.8 0 19.6 0.5 20.2 1.1 20.2Z" class="side-nav-img mr-5"/><path d="M0.7 30.7H17.5C17.8 30.7 18.2 30.1 18.2 29.3 18.2 28.6 17.8 27.9 17.5 27.9H0.7C0.3 27.9 0 28.6 0 29.3 0 30.1 0.3 30.7 0.7 30.7Z" class="side-nav-img mr-5"/></svg>
                        </span>
                        <a class="navbar-brand" href="index.html">Dashboard</a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                              <span class="navbar-toggler-icon"></span>
                            </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav ml-auto">
                                <li class="nav-item">
                                    <a class="nav-link" href="#">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" viewBox="0 0 28 28" fill="none"><path d="M22.5 20.7C21.9 20.1 21.5 19.4 21.5 18.6V13.1C21.5 12.8 21.3 12.6 21 12.6 20.7 12.6 20.4 12.8 20.4 13.1V18.6C20.4 19.7 20.9 20.7 21.7 21.5 22 21.8 22.2 22.1 22.2 22.5 22.2 23.3 21.6 24 20.8 24H3.7C2.9 24 2.3 23.3 2.3 22.5 2.3 22.1 2.5 21.8 2.8 21.5 3.6 20.7 4 19.7 4 18.6V12.3C4 7.7 7.7 4 12.2 4 13.5 4 14.7 4.3 15.8 4.9 15.4 5.5 15.2 6.2 15.2 7 15.2 9.2 17 11 19.3 11 21.5 11 23.3 9.2 23.3 7 23.3 4.8 21.5 3 19.3 3 18.2 3 17.3 3.4 16.5 4 15.7 3.6 14.8 3.3 13.9 3.1 14.1 2.8 14.3 2.4 14.3 2 14.3 0.9 13.4 0 12.2 0 11.1 0 10.2 0.9 10.2 2 10.2 2.4 10.3 2.8 10.5 3.1 6.2 3.9 2.9 7.7 2.9 12.3V18.6C2.9 19.4 2.6 20.1 2 20.7 1.5 21.2 1.2 21.8 1.2 22.5 1.2 23.9 2.3 25 3.7 25H8.8C9 26.7 10.5 28 12.2 28 14 28 15.4 26.7 15.7 25H20.8C22.2 25 23.3 23.9 23.3 22.5 23.3 21.8 23 21.2 22.5 20.7ZM19.3 4C20.9 4 22.2 5.4 22.2 7 22.2 8.6 20.9 10 19.3 10 17.6 10 16.3 8.6 16.3 7 16.3 5.4 17.6 4 19.3 4ZM12.2 1.1C12.8 1.1 13.2 1.5 13.2 2 13.2 2.5 12.8 3 12.2 3 11.7 3 11.3 2.5 11.3 2 11.3 1.5 11.7 1.1 12.2 1.1ZM12.2 26.9C11.1 26.9 10.1 26.1 9.9 25H14.6C14.3 26.1 13.4 26.9 12.2 26.9Z" class="navbar-svg"/><path d="M7.9 11.7C7.6 11.7 7.3 11.9 7.3 12.2V12.3C7.3 12.6 7.6 12.8 7.9 12.8 8.2 12.8 8.4 12.6 8.4 12.3V12.2C8.4 11.9 8.2 11.7 7.9 11.7Z" class="navbar-svg"/><path d="M14 5.6C11.3 5.6 8.9 7.2 7.8 9.6 7.7 9.9 7.9 10.2 8.1 10.4 8.2 10.4 8.3 10.4 8.4 10.4 8.6 10.4 8.8 10.3 8.9 10.1 9.7 8 11.7 6.7 14 6.7 14.3 6.7 14.5 6.4 14.5 6.1 14.5 5.8 14.3 5.6 14 5.6Z" class="navbar-svg"/><path d="M21.2 5.2C21 5.1 20.8 5.2 20.6 5.3L20 6C19.8 6.2 19.8 6.5 20 6.7 20.1 6.9 20.3 6.9 20.4 6.9V7.9C20.4 8.2 20.7 8.4 21 8.4 21.3 8.4 21.5 8.2 21.5 7.9V5.7C21.5 5.5 21.4 5.3 21.2 5.2Z" class="navbar-svg"/></svg>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="notificationModalButton">
                                        victor Agbenro <img src="../assets/images/avatar-icon.jpg" alt="" width="28" height="28" class="ml-3" style="border-radius: 50%;">
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                    <section class="col-12 p-5">
                        <div class="row justify-content-center">
                            <div class="col-12 col-md-12 col-lg-5 pl-md-5 pr-md-5 pl-0 pr-0 mt-2">
                                <div class="dash-card col-12">
                                    <div class="dash-card-head col-12">
                                        <h5 class="dash-card-title">MY ACCOUNT</h5>
                                    </div>
                                    <div class="dash-card-body col-12">
                                        <div class="row justify-content-center">
                                            <div class="col-12">
                                                <div class="row">
                                                    <div class="col-6 text-left mb-5">
                                                        <div class="row justify-content-center">
                                                            <p class="col-12">Account Number</p>
                                                            <h6 class="col-12">09066648494</h6>
                                                        </div>
                                                    </div>
                                                    <div class="col-6 text-right mb-5">
                                                        <div class="row">
                                                            <p class="col-12">Account Status</p>
                                                            <h6 class="col-12 status-active">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" viewBox="0 0 10 10" fill="none"><circle cx="5" cy="5" r="5" class="status-active-svg"/></svg> Active
                                                            </h6>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="row">
                                                    <div class="col-6 text-left">
                                                        <div class="row">
                                                            <p class="col-12">Current Balance</p>
                                                            <h6 class="col-12 balance">$ 2,000,000,000</h6>
                                                        </div>
                                                    </div>
                                                    <div class="col-6 text-right">
                                                        <div class="row justify-content-end align-items-end">
                                                            <button class="btn pl-3 pr-3">Fund Account</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-md-12 col-lg-5 pl-md-5 pr-md-5 pl-0 pr-0 mt-2">
                                <div class="dash-card col-12">
                                    <div class="dash-card-head col-12">
                                        <h5 class="dash-card-title">MY GOALS</h5>
                                    </div>
                                    <div class="dash-card-body col-12">
                                        <div class="row justify-content-center">
                                            <div class="col-12">
                                                <div class="row">
                                                    <div class="col-6 text-left mb-4">
                                                        <div class="row justify-content-start">
                                                            <span class="col-12 span mb-1 text-center">1</span>
                                                            <p class="col-12 text-center">Running Goal</p>
                                                            <a href="goal.html" class="btn mx-auto pl-3 pr-3">Create Goal</a>
                                                        </div>
                                                    </div>
                                                    <div class="col-6 text-right mb-4">
                                                        <div class="row">
                                                            <div class="achieve">
                                                                <div>
                                                                    <span>50%</span>
                                                                    <small>Goal Achived</small>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 bg-white mt-5 pt-2 pl-3 pr-5">
                                <div class="row justify-content-center">
                                    <canvas id="userChart" width="400" height="400"></canvas>
                                </div>
                                <div class="row justify-content-start mt-2">
                                    <table class="table table-striped table-borderless table-responsive-sm">
                                        <thead>
                                            <tr>
                                                <th scope="col">S/N</th>
                                                <th scope="col">Transaction Date</th>
                                                <th scope="col">Transation Type</th>
                                                <th scope="col">UserID</th>
                                                <th scope="col">Ref Number</th>
                                                <th scope="col">Account No</th>
                                                <th scope="col">Amount</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <th scope="row">1</th>
                                                <td>7/17/2019</td>
                                                <td>Income(self Deposit)</td>
                                                <td>segun</td>
                                                <td>75545578</td>
                                                <td>8118633277</td>
                                                <td class="green-txt">+100</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">2</th>
                                                <td>7/17/2019</td>
                                                <td>Income(self Deposit)</td>
                                                <td>segun</td>
                                                <td>75545578</td>
                                                <td>8118633277</td>
                                                <td class="red-txt">-100</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">3</th>
                                                <td>7/17/2019</td>
                                                <td>Income(self Deposit)</td>
                                                <td>segun</td>
                                                <td>75545578</td>
                                                <td>8118633277</td>
                                                <td class="green-txt">+100</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
</asp:Content>
