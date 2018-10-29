<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <title>录入报告</title>
    <link rel="icon" href="img/favicon.ico" />
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name=viewport content="width=device-width, initial-scale=1" />
    <link href="${ctx }/semantic/dist/semantic.min.css" rel="stylesheet" />
    <link href="${ctx }/plugins/ionicons/css/ionicons.min.css" rel="stylesheet" />
    <link href="${ctx }/css/main.css" rel="stylesheet" />
    <link href="${ctx }/plugins/datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet" />
    <link href="${ctx }/plugins/weather-icons/css/weather-icons-wind.min.css" rel="stylesheet" />
    <link href="${ctx }/plugins/weather-icons/css/weather-icons.min.css" rel="stylesheet" />
    <link href="${ctx }/plugins/chartist/chartist.min.css" rel="stylesheet" />
    <link href="${ctx }/css/chat-page.css" rel="stylesheet" />
    <link rel="shortcut icon" href="img/favicon.ico" />

</head>

<body>
    <div id="contextWrap">
        <!--sidebar-->
        <div class="ui sidebar vertical left menu overlay  borderless visible sidemenu inverted  grey" style="-webkit-transition-duration: 0.1s; transition-duration: 0.1s;" data-color="grey">
            <a class="item logo" href="index.html">
                <img src="img/logo.png" alt="stagblogo" /><img src="img/thumblogo.png" alt="stagblogo" class="displaynone" />
            </a>
            <div class="ui accordion inverted">

                <a class="title item">
                    <i class="ion-speedometer titleIcon icon"></i> Dashboard <i class="dropdown icon"></i>
                </a>
                <div class="content">
                    <a class="item" href="index.html">
                    Dashboard v1
                </a>
                </div>

                <div class="title item">
                    <i class="ion-ios-lightbulb titleIcon icon"></i>

                    <i class="dropdown icon"></i> Apps
                </div>
                <div class="content">
                    <a class="item" href="inbox.html">
                    Inbox
                </a>

                    <a class="item" href="chat.html">
                    Chat
                </a>

                    <a class="item" href="filter.html">
                    Filter
                </a>
                    <a class="item" href="todo.html">
                    Todo
                </a>
                </div>
                <div class="title item">
                    <i class="ion-ios-world titleIcon  icon"></i>

                    <i class="dropdown icon"></i> Layouts
                </div>
                <div class="content">
                    <a class="item" href="sidebar.html">
                    Sidebar
                </a>
                    <a class="item" href="menu.html">
                    Nav
                </a>

                    <a class="item" href="box.html">
                    Box
                </a>
                    <a class="item" href="cards.html">
                    Cards
                </a>
                    <a class="item" href="color.html">
                    Colors
                </a>
                    <a class="item" href="comment.html">
                    Comment
                </a>
                    <a class="item" href="embed.html">
                    Embed
                </a>
                    <a class="item" href="faq.html">
                    Faq
                </a>
                    <a class="item" href="feed.html">
                    Feed
                </a>
                    <a class="item" href="gallery.html">
                    Gallery
                </a>
                    <a class="item" href="grid.html">
                    Grid
                </a>
                    <a class="item" href="header.html">
                    Header
                </a>
                    <a class="item" href="timeline.html">
                    Timeline
                </a>
                    <a class="item" href="message.html">
                    Message
                </a>
                    <a class="item" href="price.html">
                    Price
                </a>
                </div>



                <div class="title item">
                    <i class="ion-briefcase titleIcon icon"></i>

                    <i class="dropdown icon"></i> UI-Kit
                </div>
                <div class="content">

                    <a class="item" href="breadcrumb.html">
                    Breadcrumb
                </a>
                    <a class="item" href="button.html">
                    Button
                </a>
                    <a class="item" href="divider.html">
                    Divider
                </a>

                    <a class="item" href="flag.html">
                    Flag
                </a>
                    <a class="item" href="icon.html">
                    Icon
                </a>
                    <a class="item" href="image.html">
                    Image
                </a>
                    <a class="item" href="label.html">
                    Label
                </a>
                    <a class="item" href="list.html">
                    List
                </a>
                </div>
                <div class="title item">
                    <i class="ion-mouse titleIcon icon"></i>

                    <i class="dropdown icon"></i> Script
                </div>
                <div class="content">
                    <a class="item" href="accordion.html">
                    Accordion
                </a>

                    <a class="item" href="dropdown.html">
                    Dropdown
                </a>

                    <a class="item" href="modal.html">
                    Modal
                </a>
                    <a class="item" href="notification.html">
                    Notification
                </a>
                    <a class="item" href="alert.html">
                    Alert
                </a>

                    <a class="item" href="progress.html">
                    Progress
                </a>
                    <a class="item" href="range-v1.html">
                    Range Semantic
                </a>
                    <a class="item" href="range-v2.html">
                    Range Material
                </a>
                    <a class="item" href="rating.html">
                    Rating
                </a>
                    <a class="item" href="tab.html">
                    Tab
                </a>
                    <a class="item" href="tooltip.html">
                    Tooltip
                </a>
                    <a class="item" href="transition.html">
                    Transition
                </a>
                </div>
                <div class="title item">
                    <i class="ion-bowtie titleIcon icon"></i>

                    <i class="dropdown icon"></i> Pages
                </div>
                <div class="content">
                    <a class="item" href="profile.html">
                    Profile
                </a>

                    <a class="item" href="settings.html">
                    Settings
                </a>

                    <a class="item" href="blank.html">
                    Blank
                </a>
                    <a class="item" href="login.html">
                    Sign In
                </a>
                    <a class="item" href="login.html">
                    Sign Up
                </a>
                    <a class="item" href="forgotpassword.html">
                    Forgot Password
                </a>
                    <a class="item" href="lockme.html">
                    Lock Me Screen
                </a>
                    <a class="item" href="404.html">
                    Error 404
                </a>
                    <a class="item" href="comingsoon.html">
                    Coming Soon
                </a>
                </div>

                <div class="title item">
                    <i class="ion-paintbrush titleIcon icon"></i>

                    <i class="dropdown icon"></i> Form
                </div>
                <div class="content">
                    <a class="item" href="formelements.html">
                    Form Element
                </a>
                    <a class="item" href="input.html">
                    Input
                </a>
                    <a class="item" href="formvalidation.html">
                    Form Validation
                </a>

                    <a class="item" href="editor.html">
                    Html Editor
                </a>
                </div>

                <div class="title item">
                    <i class="ion-flame titleIcon icon"></i>

                    <i class="dropdown icon"></i> Tables
                </div>
                <div class="content">
                    <a class="item" href="table.html">
                    Static Table
                </a>
                    <a class="item" href="datatable.html">
                    Datatable
                </a>
                    <a class="item" href="editable.html">
                    Editable
                </a>
                </div>
                <div class="title item">
                    <i class="ion-arrow-graph-up-right titleIcon icon"></i>

                    <i class="dropdown icon"></i> Chart
                </div>
                <div class="content">
                    <a class="item" href="chart.html">
                    Charts 1
                </a>
                    <a class="item" href="chart-2.html">
                    Charts 2
                </a>

                </div>

            </div>

            <div class="ui dropdown item displaynone scrolling">
                <span>Dashboard</span>
                <i class="ion-speedometer icon"></i>

                <div class="menu">
                    <div class="header">
                        Dashboard
                    </div>
                    <div class="ui divider"></div>
                    <a class="item" href="index.html">
                    Dashboard v1
                </a>
                </div>
            </div>


            <div class="ui dropdown item displaynone scrolling">
                <span>Apps</span>
                <i class="ion-ios-lightbulb icon"></i>
                <div class="menu">
                    <div class="header">
                        Apps
                    </div>
                    <div class="ui divider"></div>
                    <a class="item" href="inbox.html">
                    Inbox
                </a>
                    <a class="item" href="filter.html">
                    Filter
                </a>
                    <a class="item" href="todo.html">
                    Todo
                </a>
                </div>
            </div>
            <div class="ui dropdown item displaynone scrolling">
                <span>Layouts</span>
                <i class="ion-ios-world icon"></i>
                <div class="menu">
                    <div class="header">
                        Layouts
                    </div>
                    <div class="ui divider"></div>
                    <a class="item" href="sidebar.html">
                    Sidebar
                </a>
                    <a class="item" href="menu.html">
                    Nav
                </a>

                    <a class="item" href="box.html">
                    Box
                </a>
                    <a class="item" href="cards.html">
                    Cards
                </a>
                    <a class="item" href="color.html">
                    Colors
                </a>
                    <a class="item" href="comment.html">
                    Comment
                </a>
                    <a class="item" href="embed.html">
                    Embed
                </a>
                    <a class="item" href="faq.html">
                    Faq
                </a>
                    <a class="item" href="feed.html">
                    Feed
                </a>
                    <a class="item" href="gallery.html">
                    Gallery
                </a>
                    <a class="item" href="grid.html">
                    Grid
                </a>
                    <a class="item" href="header.html">
                    Header
                </a>
                    <a class="item" href="timeline.html">
                    Timeline
                </a>
                    <a class="item" href="message.html">
                    Message
                </a>
                    <a class="item" href="price.html">
                    Price
                </a>
                </div>
            </div>
            <div class="ui dropdown item displaynone scrolling">
                <span>UI-Kit</span>
                <i class="ion-briefcase icon"></i>
                <div class="menu">
                    <div class="header">
                        UI-Kit
                    </div>
                    <div class="ui divider"></div>
                    <a class="item" href="breadcrumb.html">
                    Breadcrumb
                </a>
                    <a class="item" href="button.html">
                    Button
                </a>
                    <a class="item" href="divider.html">
                    Divider
                </a>

                    <a class="item" href="flag.html">
                    Flag
                </a>
                    <a class="item" href="icon.html">
                    Icon
                </a>
                    <a class="item" href="image.html">
                    Image
                </a>
                    <a class="item" href="label.html">
                    Label
                </a>
                    <a class="item" href="list.html">
                    List
                </a>
                </div>
            </div>
            <div class="ui dropdown item displaynone scrolling">
                <span>Script</span>
                <i class="ion-mouse icon"></i>
                <div class="menu">
                    <div class="header">
                        UI-Kit
                    </div>
                    <div class="ui divider"></div>
                    <a class="item" href="accordion.html">
                    Accordion
                </a>

                    <a class="item" href="dropdown.html">
                    Dropdown
                </a>

                    <a class="item" href="modal.html">
                    Modal
                </a>
                    <a class="item" href="notification.html">
                    Notification
                </a>
                    <a class="item" href="alert.html">
                    Alert
                </a>

                    <a class="item" href="progress.html">
                    Progress
                </a>
                    <a class="item" href="range-v1.html">
                    Range Semantic
                </a>
                    <a class="item" href="range-v2.html">
                    Range Material
                </a>
                    <a class="item" href="rating.html">
                    Rating
                </a>
                    <a class="item" href="tab.html">
                    Tab
                </a>
                    <a class="item" href="tooltip.html">
                    Tooltip
                </a>
                    <a class="item" href="transition.html">
                    Transition
                </a>
                </div>
            </div>
            <div class="ui dropdown item displaynone scrolling">
                <span>Pages</span>
                <i class="ion-bowtie icon"></i>

                <div class="menu">
                    <div class="header">
                        Pages
                    </div>
                    <div class="ui divider"></div>
                    <a class="item" href="profile.html">
                    Profile
                </a>

                    <a class="item" href="settings.html">
                    Settings
                </a>

                    <a class="item" href="blank.html">
                    Blank
                </a>
                    <a class="item" href="login.html">
                    Sign In
                </a>
                    <a class="item" href="login.html">
                    Sign Up
                </a>
                    <a class="item" href="forgotpassword.html">
                    Forgot Password
                </a>
                    <a class="item" href="lockme.html">
                    Lock Me Screen
                </a>
                    <a class="item" href="404.html">
                    Error 404
                </a>
                    <a class="item" href="comingsoon.html">
                    Coming Soon
                </a>
                </div>
            </div>
            <div class="ui dropdown item displaynone scrolling">
                <span>Form</span>
                <i class="ion-paintbrush  icon"></i>

                <div class="menu">
                    <div class="header">
                        Form
                    </div>
                    <div class="ui divider"></div>
                    <a class="item" href="formelements.html">
                    Form Element
                </a>
                    <a class="item" href="input.html">
                    Input
                </a>
                    <a class="item" href="formvalidation.html">
                    Form Validation
                </a>

                    <a class="item" href="editor.html">
                    Html Editor
                </a>
                </div>
            </div>
            <div class="ui dropdown item displaynone scrolling">
                <span>Table</span>
                <i class="ion-flame icon"></i>

                <div class="menu">
                    <div class="header">
                        Table
                    </div>
                    <div class="ui divider"></div>
                    <a class="item" href="table.html">
                    Static Table
                </a>
                    <a class="item" href="datatable.html">
                    Datatable
                </a>
                    <a class="item" href="editable.html">
                    Editable
                </a>
                </div>
            </div>
            <div class="ui dropdown item displaynone scrolling">
                <span>Charts</span>
                <i class="ion-arrow-graph-up-right icon"></i>

                <div class="menu">
                    <div class="header">
                        Charts
                    </div>
                    <div class="ui divider"></div>
                    <a class="item" href="chart.html">
                    Charts 1
                </a>
                    <a class="item" href="chart-2.html">
                    Charts 2
                </a>

                </div>
            </div>
            <div class="ui divider"></div>
            <a class="item" href="typography.html">
                <i class="ion-printer icon"></i> <span class="colhidden">Typography</span>
            </a>
            <a class="item" href="document.html">
                <i class="ion-code icon"></i> <span class="colhidden">Document</span>
            </a>
            <div class="ui divider"></div>
            <a class="item">
                <div class="ui inverted progress tiny yellow" id="sidebar_progress1">
                    <div class="bar">

                    </div>
                    <div class="label colhidden" style="margin-top: 10px"><span class="colhidden">Monthly Bandwidth Transfer</span></div>
                </div>

            </a>

            <a class="item">
                <div class="ui inverted progress tiny teal" id="sidebar_progress2">
                    <div class="bar">

                    </div>
                    <div class="label colhidden" style="margin-top: 10px"><span class="colhidden">Disk Space Usage</span></div>
                </div>

            </a>
            <a class="item">
                <div class="ui inverted progress tiny blue" id="sidebar_progress3">
                    <div class="bar">

                    </div>
                    <div class="label colhidden" style="margin-top: 10px"><span class="colhidden">Earn money</span></div>
                </div>

            </a>
            <div class="ui divider"></div>

            <a class="item hiddenCollapse">
                <div class="ui one tiny inverted statistics">
                    <div class="statistic">
                        <div class="value counter">
                            3654
                        </div>
                        <div class="label">
                            Downloads
                        </div>
                    </div>
                    <div class="statistic">
                        <div class="text value">
                            Three<br> Thousand
                        </div>
                        <div class="label">
                            Views
                        </div>
                    </div>
                    <div class="statistic">
                        <div class="value">
                            <i class="ion-paperclip icon"></i><span class="counter">19</span>
                        </div>
                        <div class="label">
                            Attached File
                        </div>
                    </div>
                    <div class="statistic">
                        <div class="value">
                            <img src="img/avatar/people/carol.png" class="ui circular inline  top aligned image"><span class="counter">212</span>
                        </div>
                        <div class="label">
                            Team Members
                        </div>
                    </div>
                </div>
        </div>
        </a>
        <!--sidebar-->
        <div class="ui right sidebar">
            <div class="ui pointing secondary two item tabular menu">
                <a class="item active" data-tab="first"><i class="red icon ion-chatbox-working icon"></i></a>

                <a class="item" data-tab="fourth"><i class="blue icon ion-gear-a"></i></a>
            </div>
            <div class="ui tab active" data-tab="first">
                <div class="ui small feed">
                    <h4 class="ui header">Followers Activity</h4>
                    <div class="event">
                        <div class="label">
                            <img src="img/avatar/people/Abraham.png" alt="label-image" />
                        </div>
                        <div class="content">
                            <div class="date">
                                3 days ago
                            </div>
                            <div class="summary">
                                You added <a>Jenny Hess</a> to your <a>coworker</a> group.
                            </div>
                        </div>
                    </div>
                    <div class="event">
                        <div class="label">
                            <img src="img/avatar/people/carol.png" alt="label-image" />
                        </div>
                        <div class="content">
                            <div class="summary">
                                You added <a>Jenny Hess</a> to your <a>coworker</a> group.
                                <div class="date">
                                    3 days ago
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="event">
                        <div class="label">
                            <img src="img/avatar/people/Daryl.png" alt="label-image" />
                        </div>
                        <div class="content">
                            <div class="date">
                                3 days ago
                            </div>
                            <div class="summary">
                                You added <a>Jenny Hess</a> to your <a>coworker</a> group.
                            </div>
                        </div>
                    </div>
                    <div class="event">
                        <div class="label">
                            <img src="img/avatar/people/deana.png" alt="label-image" />
                        </div>
                        <div class="content">
                            <div class="summary">
                                You added <a>Jenny Hess</a> to your <a>coworker</a> group.
                                <div class="date">
                                    3 days ago
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="event">
                        <div class="label">
                            <img src="img/avatar/people/enid.png" alt="label-image" />
                        </div>
                        <div class="content">
                            <div class="date">
                                3 days ago
                            </div>
                            <div class="summary">
                                You added <a>Jenny Hess</a> to your <a>coworker</a> group.
                            </div>
                        </div>
                    </div>
                    <div class="event">
                        <div class="label">
                            <img src="img/avatar/people/Glenn.png" alt="label-image" />
                        </div>
                        <div class="content">
                            <div class="summary">
                                You added <a>Jenny Hess</a> to your <a>coworker</a> group.
                                <div class="date">
                                    3 days ago
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="event">
                        <div class="label">
                            <img src="img/avatar/people/Hershell.png" alt="label-image">
                        </div>
                        <div class="content">
                            <div class="date">
                                3 days ago
                            </div>
                            <div class="summary">
                                You added <a>Jenny Hess</a> to your <a>coworker</a> group.
                            </div>
                        </div>
                    </div>
                    <div class="event">
                        <div class="label">
                            <img src="img/avatar/people/Hershell.png" alt="label-image" />
                        </div>
                        <div class="content">
                            <div class="summary">
                                You added <a>Jenny Hess</a> to your <a>coworker</a> group.
                                <div class="date">
                                    3 days ago
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="event">
                        <div class="label">
                            <img src="img/avatar/people/Meggie.png" alt="label-image" />
                        </div>
                        <div class="content">
                            <div class="date">
                                3 days ago
                            </div>
                            <div class="summary">
                                You added <a>Jenny Hess</a> to your <a>coworker</a> group.
                            </div>
                        </div>
                    </div>
                    <div class="event">
                        <div class="label">
                            <img src="img/avatar/people/Michonne.png" alt="label-image" />
                        </div>
                        <div class="content">
                            <div class="summary">
                                You added <a>Jenny Hess</a> to your <a>coworker</a> group.
                                <div class="date">
                                    3 days ago
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="event">
                        <div class="label">
                            <img src="img/avatar/people/Rick.png" alt="label-image" />
                        </div>
                        <div class="content">
                            <div class="date">
                                3 days ago
                            </div>
                            <div class="summary">
                                You added <a>Jenny Hess</a> to your <a>coworker</a> group.
                            </div>
                        </div>
                    </div>
                    <div class="event">
                        <div class="label">
                            <img src="img/avatar/people/Tara.png" alt="label-image" />
                        </div>
                        <div class="content">
                            <div class="summary">
                                You added <a>Jenny Hess</a> to your <a>coworker</a> group.
                                <div class="date">
                                    3 days ago
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="ui tab" data-tab="fourth">
                <div class="ui form fluid">
                    <div class="grouped fields">
                        <label>Connection Limited</label>
                        <div class="field">
                            <div class="ui slider checkbox">
                                <input type="radio" name="throughput" checked="checked">
                                <label>20 mbps max</label>
                            </div>
                        </div>
                        <div class="field">
                            <div class="ui slider checkbox">
                                <input type="radio" name="throughput">
                                <label>10mbps max</label>
                            </div>
                        </div>
                        <div class="field">
                            <div class="ui slider checkbox">
                                <input type="radio" name="throughput">
                                <label>5mbps max</label>
                            </div>
                        </div>
                        <div class="field">
                            <div class="ui slider checkbox checked">
                                <input type="radio" name="throughput">
                                <label>Unmetered</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ui divider"></div>
                <div class="ui form fluid">
                    <div class="grouped fields">
                        <label>Notifications</label>
                        <div class="field">
                            <div class="ui toggle checkbox">
                                <input type="checkbox" checked name="public">
                                <label class="coloring red">Enabled</label>
                            </div>
                        </div>
                        <div class="field">
                            <div class="ui toggle checkbox">
                                <input type="checkbox" name="public">
                                <label class="coloring green">Updates</label>
                            </div>
                        </div>
                        <div class="field">
                            <div class="ui toggle checkbox">
                                <input type="checkbox" name="public">
                                <label>Comments</label>
                            </div>
                        </div>
                        <div class="field">
                            <div class="ui toggle checkbox">
                                <input type="checkbox" name="public">
                                <label>Chat</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ui divider"></div>

                <h4 class="ui header">Navbar Color</h4>
                <div class="ui basic segment">

                    <ul class="colorlist">
                        <li>
                            <a class="ui segment yellow inverted" data-addClass="inverted yellow">
                            </a>
                        </li>
                        <li>
                            <a class="ui segment red inverted" data-addClass="inverted red">
                            </a>
                        </li>
                        <li>
                            <a class="ui segment blue inverted" data-addClass="inverted blue">
                            </a>
                        </li>
                        <li>
                            <a class="ui segment black inverted" data-addClass="inverted black">
                            </a>
                        </li>
                        <li>
                            <a class="ui segment orange inverted" data-addClass="inverted orange">
                            </a>
                        </li>
                        <li>
                            <a class="ui segment pink inverted" data-addClass="inverted pink">
                            </a>
                        </li>
                        <li>
                            <a class="ui segment green inverted" data-addClass="inverted green">
                            </a>
                        </li>
                        <li>
                            <a class="ui segment purple inverted" data-addClass="inverted purple">
                            </a>
                        </li>
                        <li>
                            <a class="ui segment violet inverted" data-addClass="inverted violet">
                            </a>
                        </li>
                        <li>
                            <a class="ui segment brown inverted" data-addClass="inverted brown">
                            </a>
                        </li>
                        <li>
                            <a class="ui segment teal inverted" data-addClass="inverted teal">
                            </a>
                        </li>
                        <li>
                            <a class="ui segment greenli inverted" data-addClass="inverted greenli">
                            </a>
                        </li>
                        <li>
                            <a class="ui segment grey inverted" data-addClass="inverted grey">
                            </a>
                        </li>
                        <li>
                            <a class="ui segment redli inverted" data-addClass="inverted redli">
                            </a>
                        </li>
                        <li>
                            <a class="ui segment yellowli inverted" data-addClass="inverted yellowli">
                            </a>
                        </li>
                        <li>
                            <a class="ui segment blueli inverted" data-addClass="inverted blueli">
                            </a>
                        </li>
                        <li>
                            <a class="ui segment darkpurpleli inverted" data-addClass="inverted darkpurpleli">
                            </a>
                        </li>
                        <li>
                            <a class="ui segment darkorangeli inverted" data-addClass="inverted darkorangeli">
                            </a>
                        </li>
                        <li>
                            <a class="ui segment greenli2 inverted" data-addClass="inverted greenli2">
                            </a>
                        </li>
                        <li>
                            <a class="ui segment pinkli inverted" data-addClass="inverted pinkli">
                            </a>
                        </li>
                        <li>
                            <a class="ui segment lightyellowli inverted" data-addClass="inverted lightyellowli">
                            </a>
                        </li>
                        <li>
                            <a class="ui segment darkli inverted" data-addClass="inverted darkli">
                            </a>
                        </li>
                        <li>
                            <a class="ui segment lightbrownli inverted" data-addClass="inverted lightbrownli">
                            </a>
                        </li>
                    </ul>
                </div>
                <h4 class="ui header">Sidebar Color</h4>
                <div class="ui basic segment">

                    <ul class="sidecolor">
                        <li>
                            <a class="ui segment yellow inverted" data-addClass="inverted yellow">
                            </a>
                        </li>
                        <li>
                            <a class="ui segment red inverted" data-addClass="inverted red">
                            </a>
                        </li>
                        <li>
                            <a class="ui segment blue inverted" data-addClass="inverted blue">
                            </a>
                        </li>
                        <li>
                            <a class="ui segment black inverted" data-addClass="inverted black">
                            </a>
                        </li>
                        <li>
                            <a class="ui segment orange inverted" data-addClass="inverted orange">
                            </a>
                        </li>
                        <li>
                            <a class="ui segment pink inverted" data-addClass="inverted pink">
                            </a>
                        </li>
                        <li>
                            <a class="ui segment green inverted" data-addClass="inverted green">
                            </a>
                        </li>
                        <li>
                            <a class="ui segment purple inverted" data-addClass="inverted purple">
                            </a>
                        </li>
                        <li>
                            <a class="ui segment violet inverted" data-addClass="inverted violet">
                            </a>
                        </li>
                        <li>
                            <a class="ui segment brown inverted" data-addClass="inverted brown">
                            </a>
                        </li>
                        <li>
                            <a class="ui segment teal inverted" data-addClass="inverted teal">
                            </a>
                        </li>
                        <li>
                            <a class="ui segment greenli inverted" data-addClass="inverted greenli">
                            </a>
                        </li>
                        <li>
                            <a class="ui segment grey inverted" data-addClass="inverted grey">
                            </a>
                        </li>
                        <li>
                            <a class="ui segment redli inverted" data-addClass="inverted redli">
                            </a>
                        </li>
                        <li>
                            <a class="ui segment yellowli inverted" data-addClass="inverted yellowli">
                            </a>
                        </li>
                        <li>
                            <a class="ui segment blueli inverted" data-addClass="inverted blueli">
                            </a>
                        </li>
                        <li>
                            <a class="ui segment darkpurpleli inverted" data-addClass="inverted darkpurpleli">
                            </a>
                        </li>
                        <li>
                            <a class="ui segment darkorangeli inverted" data-addClass="inverted darkorangeli">
                            </a>
                        </li>
                        <li>
                            <a class="ui segment greenli2 inverted" data-addClass="inverted greenli2">
                            </a>
                        </li>
                        <li>
                            <a class="ui segment pinkli inverted" data-addClass="inverted pinkli">
                            </a>
                        </li>
                        <li>
                            <a class="ui segment lightyellowli inverted" data-addClass="inverted lightyellowli">
                            </a>
                        </li>
                        <li>
                            <a class="ui segment darkli inverted" data-addClass="inverted darkli">
                            </a>
                        </li>
                        <li>
                            <a class="ui segment lightbrownli inverted" data-addClass="inverted lightbrownli">
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="pusher">
            <!--navbar-->
            <div class="navslide navwrap">
                <div class="ui menu icon borderless grid" data-color="inverted white">
                    <a class="item labeled openbtn">
                        <i class="ion-navicon-round big icon"></i>
                    </a>
                    <a class="item labeled expandit" onclick="toggleFullScreen(document.body)">
                        <i class="ion-arrow-expand big icon"></i>
                    </a>
                    <div class="item ui colhidden">
                        <div class="ui icon input">
                            <input type="text" placeholder="Search...">
                            <i class="search icon"></i>
                        </div>
                    </div>
                    <div class="right menu colhidden">

                        <div class="ui dropdown item labeled icon">
                            <i class="bell icon"></i>
                            <div class="ui red label mini circular">6</div>
                            <div class="menu">
                                <div class="header">
                                    People You Might Know
                                </div>
                                <div class="item">
                                    <img class="ui avatar image" src="img/avatar/people/enid.png" alt="label-image" /> Janice Robinson
                                </div>
                                <div class="item">
                                    <img class="ui avatar image" src="img/avatar/people/Hershell.png" alt="label-image" /> Cynthia May
                                </div>
                                <div class="item">
                                    <img class="ui avatar image" src="img/avatar/people/Rick.png" alt="label-image" /> Hugh Carter
                                </div>
                                <div class="header">
                                    Your Friends' Friends
                                </div>
                                <div class="item">
                                    <img class="ui avatar image" src="img/avatar/people/Meggie.png" alt="label-image" /> Pauline Cain
                                </div>
                                <div class="item">
                                    <img class="ui avatar image" src="img/avatar/people/Glenn.png" alt="label-image" /> Marco Beck
                                </div>
                                <div class="item">
                                    <img class="ui avatar image" src="img/avatar/people/Daryl.png" alt="label-image" /> Sue Quinn
                                </div>
                            </div>
                        </div>
                        <div class="ui dropdown item">
                            Language <i class="dropdown icon"></i>
                            <div class="menu">
                                <a class="item"><i class="united kingdom flag"></i>English</a>
                                <a class="item"><i class="turkey flag"></i>Turkish</a>
                                <a class="item"><i class="spain flag"></i>Spanish</a>
                            </div>
                        </div>
                        <div class="ui dropdown item">
                            <img class="ui mini circular image" src="img/avatar/people/enid.png" alt="label-image" />
                            <div class="menu">
                                <a class="item" href="mail.html">Inbox</a>
                                <a class="item" href="profile.html">Profile</a>
                                <a class="item" href="settings.html">Settings</a>
                                <div class="ui divider"></div>
                                <a class="item">Need Help?</a>
                                <a class="item" href="login.html">Sign Out</a>
                            </div>
                        </div>
                        <a class="item labeled rightsidebar computer only">
                            <i class="ion-wrench large icon"></i>
                        </a>

                    </div>
                </div>
            </div>
            <!--navbar-->
            <!--maincontent-->
            <div class="mainWrap navslide" id="father">
            <div class="ui equal width left aligned padded grid stackable">
                <!--Site Content-->

                        <div>
                        <div class="ui teal labeled icon button" onclick="addtext(this)" >
                        		添加文字
                                            <i class="add icon"></i>
                        </div>
                        <div class="ui teal labeled icon button" onclick="addgraph(this)" >
                        		添加图
                                            <i class="add icon"></i>
                        </div>
                        <div class="ui teal labeled icon button" onclick="addtable(this)" >
                        		添加表
                                            <i class="add icon"></i>
                        </div>
                        </div>
            </div>
                <!--Site Content-->
        	</div>
        	<div class="mainWrap navslide">
        	<div class="ui equal width left aligned padded grid stackable">
        		<div>
        			<button class="ui primary button saving" onclick="savereport()" >保存</button>
        		</div>
        	</div>
        </div>
        
        
           

            <!--maincontent-->
        </div>
    </div>
    <!--jquery-->
    <script src="${ctx }/js/jquery-2.1.4.min.js"></script>
    <!--jquery-->
    <!--semantic-->
    <script src="${ctx }/semantic/dist/semantic.min.js"></script>
    <!--semantic-->
    <!--counter number-->
    <script src="${ctx }/plugins/counterup/jquery.counterup.min.js"></script>
    <script src="${ctx }/plugins/counterup/waypoints.min.js"></script>
    <!--counter number-->
    <!--flot chart-->
    <script src="${ctx }/plugins/flot/jquery.flot.js"></script>
    <script src="${ctx }/plugins/flot/jquery.flot.resize.min.js"></script>
    <script src="${ctx }/plugins/flot/jquery.flot.tooltip.min.js"></script>
    <script src="${ctx }/plugins/flot/curvedLines.js"></script>
    <script src="${ctx }/plugins/cookie/js.cookie.js"></script>
    <!--flot chart-->
    <!--chartjs chart-->
    <script src="${ctx }/plugins/chartjs/chart.min.js"></script>
    <!--chartjs chart-->

    <script src="${ctx }/plugins/nicescrool/jquery.nicescroll.min.js"></script>

    <script data-pace-options='{ "ajax": false }' src="${ctx }/plugins/pacejs/pace.js"></script>

    <script src="${ctx }/plugins/chartist/chartist.min.js"></script>

    <script src="${ctx }/js/dashboard2.js"></script>
    <script src="${ctx }/js/main.js"></script>
    <script type="text/javascript">
    	window.onload=function(){
    		var data="${data}".split(',');
    		var jsonData="";
    		for(var i=0;i<data.length-1;i++) jsonData+=String.fromCharCode(data[i]);
    		jsonData=JSON.parse(jsonData);
    		var fa = document.getElementById("father");
    		for(i in jsonData){
    			if(jsonData[i]["type"]=="graph"){
    				var imghtml=jsonData[i]["text"];
    				var divnew = document.createElement("div");
		    		divnew.className = "ui equal width left aligned padded grid stackable";
		    		divnew.id = new Date().getTime();
		    		divnew.innerHTML = `
		                            <div class="row">
		                            <div class="sixteen wide column">
		                                <div class="ui segments">
		                                	<div class="ui segment">
		                                        <h5 class="ui header">
		                                            添加图
		                                        </h5>
		                                    </div>
		                                    <div class="ui segment">
		                                    	书签名称（格式：地区代码_书签）：
		                                    	<div class="ui fluid action input">
		                                    		<input type="text" placeholder="输入书签" />
		                                    		<div class="positive ui button" onclick="getgraph(this)">确定</div>
		                                    	</div>
		                               			
		                                    </div>
		                                    <div class="ui segment">
		                                    	<div class="mkgraph" display='none'></div>
		                                    	<img src="`+imghtml+`">
                                    		</div>
		                                </div>
		                            </div>
		                        </div>
		                        <div>
		                        <div class="ui teal labeled icon button" onclick="addtext(this)" id="0">
		                        		添加文字
		                                            <i class="add icon"></i>
		                        </div>
		                        <div class="ui teal labeled icon button" onclick="addgraph(this)" >
		                        		添加图
		                                            <i class="add icon"></i>
		                        </div>
		                        <div class="ui teal labeled icon button" onclick="addtable(this)" >
		                        		添加表
		                                            <i class="add icon"></i>
		                        </div>
		                        <button class="negative ui button" onclick="deleteseg(this)">删除</button>
		                        </div>
		    		`;
		    		fa.appendChild(divnew);
    			}
    			else{
    				var textcontent=jsonData[i]["text"];
    				var texttype=jsonData[i]["type"];
    				var divnew = document.createElement("div");
		    		divnew.className = "ui equal width left aligned padded grid stackable";
		    		divnew.id = new Date().getTime();
		    		divnew.innerHTML = `
		                            <div class="row">
		                            <div class="sixteen wide column">
		                                <div class="ui segments">
		                                	<div class="ui segment">
		                                        <h5 class="ui header">
		                                            添加文字
		                                        </h5>
		                                    </div>
		                                	<div class="ui segment">
		                                    	文字级别：
		                                    	<select name = "texttype">
		                                    		<option value="texttitle1">一级标题</option>
													<option value="texttitle2">二级标题</option>
													<option value="texttitle3">三级标题</option>
													<option value="texttitle4">四级标题</option>
													<option value="textbody">正文</option>
													<option value="imagetitle">图表标题</option>
													<option value="textnote">注释</option>
		                                    	</select>
		                                	</div>
		                                	<div class="ui segment">
		                                		<div class="mktext" display='none'></div>
		                                        <div class="ui form">
		                                            <div class="field">
		                                                <textarea class="tinymceeditor"></textarea>
		                                            </div>
		                                        </div>
		                                	</div>
		                            	</div>
		                            </div>
		                        </div>
		                        <div>
		                        <div class="ui teal labeled icon button" onclick="addtext(this)" id="0">
		                        		添加文字
		                                            <i class="add icon"></i>
		                        </div>
		                        <div class="ui teal labeled icon button" onclick="addgraph(this)" >
		                        		添加图
		                                            <i class="add icon"></i>
		                        </div>
		                        <div class="ui teal labeled icon button" onclick="addtable(this)" >
		                        		添加表
		                                            <i class="add icon"></i>
		                        </div>
		                        <button class="negative ui button" onclick="deleteseg(this)">删除</button>
		                        </div>
		                        
		    		`;
		    		var segs=divnew.children[0].children[0].children[0];
    				var configseg=segs.children[1];
    				var contentseg=segs.children[2];
    				contentseg.children[1].children[0].children[0].value=textcontent;
    				configseg.children[0].value=texttype;
    				fa.appendChild(divnew);
    			}
    		}
    	}
    	
    	function addtext(obj){
    		var divnew = document.createElement("div");
    		divnew.className = "ui equal width left aligned padded grid stackable";
    		divnew.id = new Date().getTime();
    		divnew.innerHTML = `
                            <div class="row">
                            <div class="sixteen wide column">
                                <div class="ui segments">
                                	<div class="ui segment">
                                        <h5 class="ui header">
                                            添加文字
                                        </h5>
                                    </div>
                                	<div class="ui segment">
                                    	文字级别：
                                    	<select name = "texttype">
                                    		<option value="texttitle1">一级标题</option>
											<option value="texttitle2">二级标题</option>
											<option value="texttitle3">三级标题</option>
											<option value="texttitle4">四级标题</option>
											<option value="textbody">正文</option>
											<option value="imagetitle">图表标题</option>
											<option value="textnote">注释</option>
                                    	</select>
                                	</div>
                                	<div class="ui segment">
                                		<div class="mktext" display='none'></div>
                                        <div class="ui form">
                                            <div class="field">
                                                <textarea class="tinymceeditor"></textarea>
                                            </div>
                                        </div>
                                	</div>
                            	</div>
                            </div>
                        </div>
                        <div>
                        <div class="ui teal labeled icon button" onclick="addtext(this)" id="0">
                        		添加文字
                                            <i class="add icon"></i>
                        </div>
                        <div class="ui teal labeled icon button" onclick="addgraph(this)" >
                        		添加图
                                            <i class="add icon"></i>
                        </div>
                        <div class="ui teal labeled icon button" onclick="addtable(this)" >
                        		添加表
                                            <i class="add icon"></i>
                        </div>
                        <button class="negative ui button" onclick="deleteseg(this)">删除</button>
                        </div>
                        
    		`;
    		var ff=obj.parentNode;
    		var fff=ff.parentNode;
    		fff.after(divnew);
    	}
    	
    	
    	
    	function addgraph(obj){
    		var divnew = document.createElement("div");
    		divnew.className = "ui equal width left aligned padded grid stackable";
    		divnew.id = new Date().getTime();
    		divnew.innerHTML = `
                            <div class="row">
                            <div class="sixteen wide column">
                                <div class="ui segments">
                                	<div class="ui segment">
                                        <h5 class="ui header">
                                            添加图
                                        </h5>
                                    </div>
                                    <div class="ui segment">
                                    	书签名称（格式：地区代码_书签）：
                                    	<div class="ui fluid action input">
                                    		<input type="text" placeholder="输入书签" />
                                    		<div class="positive ui button" onclick="getgraph(this)">确定</div>
                                    	</div>
                               			
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                        <div class="ui teal labeled icon button" onclick="addtext(this)" id="0">
                        		添加文字
                                            <i class="add icon"></i>
                        </div>
                        <div class="ui teal labeled icon button" onclick="addgraph(this)" >
                        		添加图
                                            <i class="add icon"></i>
                        </div>
                        <div class="ui teal labeled icon button" onclick="addtable(this)" >
                        		添加表
                                            <i class="add icon"></i>
                        </div>
                        <button class="negative ui button" onclick="deleteseg(this)">删除</button>
                        </div>
    		`;
    		var ff=obj.parentNode;
    		var fff=ff.parentNode;
    		fff.after(divnew);
    	}
    	
    	function getgraphbymark(mark){
    		//return "http://files.57gif.com/webgif/0/4/84/bcd4b2814bbf8341e94a71ef35593.gif";
    		var path = "";
    		$.ajax({
	            type:"post",
	            url:"${ctx}/draw-graph.action",
	            data:{"data":mark},
	            async: false,
	            success:function(msg) {
	                data=msg.split('&');
	                path="files/graph/"+data[0]+".png";
	            },
	            error:function(msg) {
	                console.log(msg);
	            }
	        });
	        return path;
    	}
    	
    	function getgraph(obj){
    		var bro=obj.previousElementSibling;
    		var tt=bro.value;
    		var imlink=getgraphbymark(tt);
    		var imghtml="<img src=../"+imlink+">";
    		var divnew=document.createElement("div");
    		divnew.className="ui segment";
    		divnew.innerHTML=`
    			<div class="mkgraph" display='none'></div>
            `+imghtml;
    		var parent=obj.parentNode;
    		var pparent=parent.parentNode;
    		pparent.after(divnew);
    	}
    	
    	
    	
    	function addtable(obj){
    		var divnew = document.createElement("div");
    		divnew.className = "ui equal width left aligned padded grid stackable";
    		divnew.id = new Date().getTime();
    		divnew.innerHTML = `
                            <div class="row">
                            <div class="sixteen wide column">
                                <div class="ui segments">
                                	<div class="ui segment">
                                        <h5 class="ui header">
                                            添加表
                                        </h5>
                                    </div>
                                    <div class="ui segment">
                                    	输入行数：
                                    	<select name = "rownumber">
                                    		<option value="1">表类型一</option>
											<option value="2">表类型二</option>
											<option value="3">表类型三</option>
											<option value="4">表类型四</option>
											<option value="5">表类型五</option>
											<option value="6">表类型六</option>
                                    	</select>
                                    	输入列数：
                                    	<select name = "dbusing">
                                    		<option value="1">一年级</option>
											<option value="2">二年级</option>
											<option value="3">三年级</option>
											<option value="4">四年级</option>
											<option value="5">五年级</option>
											<option value="6">六年级</option>
											<option value="7">初一</option>
											<option value="8">初二</option>
											<option value="9">初三</option>
                                    	</select>
                                    	变量名：
                                    	<select name = "parameter">
                                    		<option value="1">变量名一</option>
											<option value="2">变量名二</option>
											<option value="3">变量名三</option>
											<option value="4">变量名四</option>
											<option value="5">变量名五</option>
											<option value="6">变量名六</option>
                                    	</select>
                                    	运算类型：
                                    	<select name = "opertype">
                                    		<option value="1">运算一</option>
											<option value="2">运算二</option>
											<option value="3">运算三</option>
											<option value="4">运算四</option>
											<option value="5">运算五</option>
											<option value="6">运算六</option>
                                    	</select>
                                    	<button class="positive ui button" onclick="gettable()">确定</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                        <div class="ui teal labeled icon button" onclick="addtext(this)" id="0">
                        		添加文字
                                            <i class="add icon"></i>
                        </div>
                        <div class="ui teal labeled icon button" onclick="addgraph(this)" >
                        		添加图
                                            <i class="add icon"></i>
                        </div>
                        <div class="ui teal labeled icon button" onclick="addtable(this)" >
                        		添加表
                                            <i class="add icon"></i>
                        </div>
                        <button class="negative ui button" onclick="deleteseg(this)">删除</button>
                        </div>
    		`;
    		var ff=obj.parentNode;
    		var fff=ff.parentNode;
    		fff.after(divnew);
    	}
    	
    	
    	
    	function hideseg(obj){
    		var ff=obj.parentNode;
    		var fff=ff.parentNode;
    		fff.style.display='none';
    	}
    	
    	function deleteseg(obj){
    		var ff=obj.parentNode;
    		var fff=ff.parentNode;
    		var ffff=fff.parentNode;
    		ffff.removeChild(fff);
    	}
    	
    	
    	
    	function savereport(){
    		/*var doccontent="";
    		var parts=document.getElementById("father").children;
    		for(var i=1,len=parts.length;i<len;i++){
    			var segs=parts[i].children[0].children[0].children[0];
    			var configseg=segs.children[1];
    			var contentseg=segs.children[2];
    			var mark=contentseg.children[0];
    			if(mark.className=="mktext"){
    				var text=contentseg.children[1].children[0].children[0].value;
    				//alert(text);
    				var sele=configseg.children[0];
    				var index=sele.selectedIndex;
    				var texttype=sele.options[index].value;
    				//alert(texttype);
    				if(texttype=="title1"){
    					doccontent+="<h1>"+text+"</h1>";
    				}
    				else if(texttype=="title2"){
    					doccontent+="<h2>"+text+"</h2>";
    				}
    				else if(texttype=="title3"){
    					doccontent+="<h3>"+text+"</h3>";
    				}
    				else if(texttype=="title4"){
    					doccontent+="<h4>"+text+"</h4>";
    				}
    				else if(texttype=="body"){
    					doccontent+=text;
    				}
    				else if(texttype=="other"){
    					doccontent+=text;
    				}
    			}
    			else{
    				if(mark.className=="mkgraph"){
    					doccontent+=contentseg.innerHTML;
    				}
    				else{
    					doccontent+=("this is a table");
    				}
    			}
    		}
    		alert(doccontent);*/
    		var _list = {};
    		var len = 0;
    		var parts=document.getElementById("father").children;
    		for(var i=1;i<parts.length;i++){
    			var segs=parts[i].children[0].children[0].children[0];
    			var configseg=segs.children[1];
    			var contentseg=segs.children[2];
    			var mark=contentseg.children[0];
    			if(mark.className=="mktext"){
    				var sele=configseg.children[0];
    				var index=sele.selectedIndex;
    				_list[len]=new Object();
    				_list[len].text=contentseg.children[1].children[0].children[0].value;
    				_list[len].type=sele.options[index].value
    				len++;
    			}
    			else if(mark.className=="mkgraph"){
    				_list[len]=new Object();
    				_list[len].type="graph";
    				_list[len].text=contentseg.children[1].getAttribute("src");
    				len++;
    			}
    		}
    		var tmp=JSON.stringify(_list);
    		var res="";
    		for(var i=0;i<tmp.length;i++)
    			res+=tmp.charCodeAt(i)+",";
    		var temp = document.createElement("form");
		    temp.action = "${ctx}/design/save-html.action?reportId=${report.id}";
		    temp.method = "post";
		    temp.style.display = "none";
		    var opt = document.createElement("textarea");
		    opt.name = "data";
		    opt.value = res;
		    temp.appendChild(opt);
		    document.body.appendChild(temp);
		    temp.submit();
		    return temp;
    	}
    	
    </script>
</body>

</html>
