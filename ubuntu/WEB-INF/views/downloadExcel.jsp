<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

    <!-- title -->
    <title>TableExport Plugin</title>

    <!--stylesheets-->
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/bootstrap-theme.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/tableexport.css" rel="stylesheet">

    <!-- prettify -->
    <script src="https://cdn.rawgit.com/google/code-prettify/master/loader/run_prettify.js?lang=css&skin=desert"></script>

    <!-- shortcut icon -->
    <link rel="shortcut icon" href="favicon.ico">

</head>
<body>

<header id="top" role="banner">
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">TableExport.js</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <form class="navbar-form navbar-right" role="search">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search">
                    </div>
                    <button type="submit" class="btn btn-default">Submit</button>
                </form>
                <ul class="nav navbar-nav navbar-right">
                    <!--<li><a href="#">Link</a></li>-->
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Menu <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Resume</a></li>
                            <li><a href="#">TBD</a></li>
                            <li><a href="#">TBD</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#">TBD</a></li>
                        </ul>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</header>


<header>
    <div class="jumbotron">
        <div class="container">
            <h1>TableExport.js</h1>
            <br>
            <p>The simple, easy-to-implement jQuery plugin that allows you to quickly and dynamically convert HTML tables to <strong>Excel spreadsheets</strong> <code> .xlsx</code>, <strong>comma separated values</strong> <code>.csv</code>, and <strong>plain text</strong> <code>.txt</code> in only one line of code.</p>
            <br>
            <p><a href="#" class="btn btn-danger btn-lg" role="button" download><i class="fa fa-download"></i> Download</a></p>
        </div>
    </div>
</header>


<main>
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                <h1 id="getting-started" class="page-header">Getting Started</h1>
                <div class="row">
                    <div class="col-xs-12">
                        <h3 id="download">Download and Setup</h3>
                        <br>


                        <div class="code-block">
                            <span class="btn-clipboard" title="Copy to clipboard">Copy</span>
                        <pre class="prettyprint">
&lt;script type="text/javascript" src="/path/to/jquery-1.11.3.min.js"&gt;&lt;/script&gt;
&lt;script type="text/javascript" src="/path/to/jquery.tableexport.js"&gt;&lt;/script&gt;</pre>
                        </div>
                    </div>
                </div>
                <br>
                <br>

                <div class="row">
                    <div class="col-xs-12">
                        <h3 id="bower">Install with Bower</h3>
                        <br>

                    </div>
                </div>
                <br>
                <br>

                <div class="row">
                    <div class="col-xs-12">
                        <h3 id="dependencies">Dependencies</h3>
                        <br>

                        <p>In order to download Excel(.xlsx) files, the following plugins are required:</p>
                        <ul>
                            <li>xlsx.core.js</li>
                            <li>Blob.js</li>
                            <li>FileSaver.js</li>
                            <li>Export2Excel.js</li>
                        </ul>
                    </div>
                </div>
                <br>
                <br>

                <h1 id="usage" class="page-header">Usage</h1>
                <div class="row">
                    <div class="col-xs-12">
                        <h3 id="methods">Methods</h3>
                        <br>

                    </div>
                </div>
                <br>
                <br>

                <div class="row">
                    <div class="col-xs-12">
                        <h3 id="settings">Settings</h3>
                        <br>

                    </div>
                </div>
                <br>
                <br>

                <div class="row">
                    <div class="col-xs-12">
                        <h3 id="css">CSS</h3>
                        <br>

                        <div class="code-block">
                            <span class="btn-clipboard" title="Copy to clipboard">Copy</span>
                        <pre class="prettyprint lang-css">
/* [String] column separator, [default: ","] */
.top,
.head {
    caption-side: top;
}

.bottom {
    caption-side: bottom;
}</pre>
                        </div>
                    </div>
                </div>

                <br>
                <br>

                <div class="row">
                    <div class="col-xs-12">
                        <h3 id="javascript">JavaScript</h3>
                        <br>

                        <div class="code-block">
                            <span class="btn-clipboard" title="Copy to clipboard">Copy</span>
                            <pre class="prettyprint">$("table").tableExport();</pre>
                        </div>

                        <div class="code-block">
                            <span class="btn-clipboard" title="Copy to clipboard">Copy</span>
                        <pre class="prettyprint">
$("table").tableExport({
    separator: ",",                         // [String] column separator, [default: ","]
    headings: true,                         // [Boolean], display table headings (th elements) in the first row, [default: true]
    buttonContent: "Export",                // [String], text/html to display in the export button, [default: "Export file"]
    addClass: "",                           // [String], additional button classes to add, [default: ""]
    defaultClass: "btn",                    // [String], the default button class, [default: "btn"]
    defaultTheme: "btn-default",            // [String], the default button theme, [default: "btn-default"]
    type: "csv",                            // [xlsx, csv, txt], type of file, [default: "csv"]
    fileName: "export",                     // [id, name, String], filename for the downloaded file, [default: "export"]
    position: "bottom",                     // [top, bottom], position of the caption element relative to table, [default: "bottom"]
    stripQuotes: true                       // [Boolean], remove containing double quotes (.txt files ONLY), [default: true]
});</pre>
                        </div>

                    </div>
                </div>
                <br>
                <br>

                <h1 id="browser-support" class="page-header">Browser Support</h1>
                <div class="row">
                    <div class="col-md-12">
                        <br>
                        <div class="table-responsive">
                            <table class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <td></td>
                                    <th>Chrome</th>
                                    <th>Firefox</th>
                                    <th>Internet Explorer</th>
                                    <th>Opera</th>
                                    <th>Safari</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row">Android</th>
                                    <td class="text-success"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span></td>
                                    <td class="text-success"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span></td>
                                    <td class="text-muted" rowspan="4" style="vertical-align: middle;">N/A</td>
                                    <td class="text-danger"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></td>
                                    <td class="text-muted">N/A</td>
                                </tr>
                                <tr>
                                    <th scope="row">iOS</th>
                                    <td class="text-success"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span></td>
                                    <td class="text-muted">N/A</td>
                                    <td class="text-danger"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></td>
                                    <td class="text-success"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span></td>
                                </tr>
                                <tr>
                                    <th scope="row">Mac OS X</th>
                                    <td class="text-success"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span></td>
                                    <td class="text-success"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span></td>
                                    <td class="text-success"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span></td>
                                    <td class="text-success"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span></td>
                                </tr>
                                <tr>
                                    <th scope="row">Windows</th>
                                    <td class="text-success"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span></td>
                                    <td class="text-success"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span></td>
                                    <td class="text-success"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span></td>
                                    <td class="text-danger"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <br>
                <br>

                <h1 id="live-demo" class="page-header">Live Demo</h1>
                <div class="row">
                    <div class="col-md-12">
                        <h3 id="demo-1">Demo 1</h3>
                        <br>
                        <h4>Countries By Population</h4>

                        <div class="table-responsive">
                            <table id="Population-list-1" class="table table-striped table-bordered"
                                   data-name="cool-table">
                                <thead>
                                <tr>
                                    <th>Rank</th>
                                    <th>Country</th>
                                    <th>Population</th>
                                    <th>% of world population</th>
                                    <th>Date</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>China</td>
                                    <td>1,370,570,000</td>
                                    <td>18.9%</td>
                                    <td>June 24, 2015</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>India</td>
                                    <td>1,273,140,000</td>
                                    <td>17.6%</td>
                                    <td>June 24, 2015</td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>United States</td>
                                    <td>321,268,000</td>
                                    <td>4.43%</td>
                                    <td>June 24, 2015</td>
                                </tr>
                                <tr>
                                    <td>4</td>
                                    <td>Indonesia</td>
                                    <td>255,461,700</td>
                                    <td>3.52%</td>
                                    <td>July 1, 2015</td>
                                </tr>
                                <tr>
                                    <td>5</td>
                                    <td>Brazil</td>
                                    <td>204,503,000</td>
                                    <td>2.82%</td>
                                    <td>June 24, 2015</td>
                                </tr>
                                <tr>
                                    <td>6</td>
                                    <td>Pakistan</td>
                                    <td>190,156,000</td>
                                    <td>2.62%</td>
                                    <td>June 24, 2015</td>
                                </tr>
                                <tr>
                                    <td>7</td>
                                    <td>Nigeria</td>
                                    <td>183,523,000</td>
                                    <td>2.53%</td>
                                    <td>July 1, 2015</td>
                                </tr>
                                <tr>
                                    <td>8</td>
                                    <td>Bangladesh</td>
                                    <td>126,880,000</td>
                                    <td>2.19%</td>
                                    <td>June 24, 2015</td>
                                </tr>
                                <tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-md-12">
                        <h3 id="demo-2">Demo 2</h3>
                        <br>
                        <h4>Countries By Population</h4>

                        <div class="table-responsive">
                            <table id="Population-list-2" class="table table-striped table-bordered"
                                   data-name="cool-table">
                                <thead>
                                <tr>
                                    <th>Rank</th>
                                    <th>Country</th>
                                    <th>Population</th>
                                    <th>% of world population</th>
                                    <th>Date</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>China</td>
                                    <td>1,370,570,000</td>
                                    <td>18.9%</td>
                                    <td>June 24, 2015</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>India</td>
                                    <td>1,273,140,000</td>
                                    <td>17.6%</td>
                                    <td>June 24, 2015</td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>United States</td>
                                    <td>321,268,000</td>
                                    <td>4.43%</td>
                                    <td>June 24, 2015</td>
                                </tr>
                                <tr>
                                    <td>4</td>
                                    <td>Indonesia</td>
                                    <td>255,461,700</td>
                                    <td>3.52%</td>
                                    <td>July 1, 2015</td>
                                </tr>
                                <tr>
                                    <td>5</td>
                                    <td>Brazil</td>
                                    <td>204,503,000</td>
                                    <td>2.82%</td>
                                    <td>June 24, 2015</td>
                                </tr>
                                <tr>
                                    <td>6</td>
                                    <td>Pakistan</td>
                                    <td>190,156,000</td>
                                    <td>2.62%</td>
                                    <td>June 24, 2015</td>
                                </tr>
                                <tr>
                                    <td>7</td>
                                    <td>Nigeria</td>
                                    <td>183,523,000</td>
                                    <td>2.53%</td>
                                    <td>July 1, 2015</td>
                                </tr>
                                <tr>
                                    <td>8</td>
                                    <td>Bangladesh</td>
                                    <td>126,880,000</td>
                                    <td>2.19%</td>
                                    <td>June 24, 2015</td>
                                </tr>
                                <tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-md-12">
                        <h3 id="demo-3">Demo 3</h3>
                        <br>
                        <h4>Countries By Population</h4>

                        <div class="table-responsive">
                            <table id="Population-list-3" class="table table-striped table-bordered"
                                   data-name="cool-table">
                                <thead>
                                <tr>
                                    <th>Rank</th>
                                    <th>Country</th>
                                    <th>Population</th>
                                    <th>% of world population</th>
                                    <th>Date</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>China</td>
                                    <td>1,370,570,000</td>
                                    <td>18.9%</td>
                                    <td>June 24, 2015</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>India</td>
                                    <td>1,273,140,000</td>
                                    <td>17.6%</td>
                                    <td>June 24, 2015</td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>United States</td>
                                    <td>321,268,000</td>
                                    <td>4.43%</td>
                                    <td>June 24, 2015</td>
                                </tr>
                                <tr>
                                    <td>4</td>
                                    <td>Indonesia</td>
                                    <td>255,461,700</td>
                                    <td>3.52%</td>
                                    <td>July 1, 2015</td>
                                </tr>
                                <tr>
                                    <td>5</td>
                                    <td>Brazil</td>
                                    <td>204,503,000</td>
                                    <td>2.82%</td>
                                    <td>June 24, 2015</td>
                                </tr>
                                <tr>
                                    <td>6</td>
                                    <td>Pakistan</td>
                                    <td>190,156,000</td>
                                    <td>2.62%</td>
                                    <td>June 24, 2015</td>
                                </tr>
                                <tr>
                                    <td>7</td>
                                    <td>Nigeria</td>
                                    <td>183,523,000</td>
                                    <td>2.53%</td>
                                    <td>July 1, 2015</td>
                                </tr>
                                <tr>
                                    <td>8</td>
                                    <td>Bangladesh</td>
                                    <td>126,880,000</td>
                                    <td>2.19%</td>
                                    <td>June 24, 2015</td>
                                </tr>
                                <tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-md-12">
                        <h3 id="demo-4">Demo 4</h3>
                        <br>
                        <h4>Countries By Population</h4>

                        <div class="table-responsive">
                            <table id="Population-list" class="table table-striped table-bordered"
                                   data-name="cool-table">
                                <thead>
                                <tr>
                                    <th>Rank</th>
                                    <th>Country</th>
                                    <th>Population</th>
                                    <th>% of world population</th>
                                    <th>Date</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>China</td>
                                    <td>1,370,570,000</td>
                                    <td>18.9%</td>
                                    <td>June 24, 2015</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>India</td>
                                    <td>1,273,140,000</td>
                                    <td>17.6%</td>
                                    <td>June 24, 2015</td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>United States</td>
                                    <td>321,268,000</td>
                                    <td>4.43%</td>
                                    <td>June 24, 2015</td>
                                </tr>
                                <tr>
                                    <td>4</td>
                                    <td>Indonesia</td>
                                    <td>255,461,700</td>
                                    <td>3.52%</td>
                                    <td>July 1, 2015</td>
                                </tr>
                                <tr>
                                    <td>5</td>
                                    <td>Brazil</td>
                                    <td>204,503,000</td>
                                    <td>2.82%</td>
                                    <td>June 24, 2015</td>
                                </tr>
                                <tr>
                                    <td>6</td>
                                    <td>Pakistan</td>
                                    <td>190,156,000</td>
                                    <td>2.62%</td>
                                    <td>June 24, 2015</td>
                                </tr>
                                <tr>
                                    <td>7</td>
                                    <td>Nigeria</td>
                                    <td>183,523,000</td>
                                    <td>2.53%</td>
                                    <td>July 1, 2015</td>
                                </tr>
                                <tr>
                                    <td>8</td>
                                    <td>Bangladesh</td>
                                    <td>126,880,000</td>
                                    <td>2.19%</td>
                                    <td>June 24, 2015</td>
                                </tr>
                                <tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <br>
                <br>

                <h1 id="license" class="page-header">License</h1>
                <div class="row">
                    <div class="col-xs-12">
                        <br>

                        <p class="lead">sample</p>
                        <p>sample</p>
                        <p>sample</p>
                        <p>sample</p>
                        <p>sample</p>

                    </div>
                </div>
                <br>
                <br>

                <h1 id="credits" class="page-header">Credits</h1>
                <div class="row">
                    <div class="col-xs-12">
                        <br>

                    </div>
                </div>

                <br>
            </div>
            <div class="col-md-3 scrollspy">
                <nav id="side-nav" class="affix-top hidden-xs hidden-sm">
                    <ul id="side-nav-ul" class="nav nav-pills nav-stacked">
                        <li><a href="#getting-started">Getting Started</a></li>
                        <!--<li><a href="#download">Download and Setup</a></li>-->
                        <!--<li><a href="#bower">Install with Bower</a></li>-->
                        <!--<li><a href="#composer">Install with Composer</a></li>-->
                        <!--<li><a href="#dependencies">Dependencies</a></li>-->
                        <li><a href="#usage">Usage</a></li>
                        <!--<li><a href="#methods">Methods</a></li>-->
                        <!--<li><a href="#settings">Settings<span class="hidden">Properties</span></a></li>-->
                        <!--<li><a href="#css">CSS</a></li>-->
                        <!--<li><a href="#javascript">JavaScript</a></li>-->
                        <li><a href="#browser-support">Browser Support</a></li>
                        <li><a href="#live-demo">Live Demo</a></li>
                        <!--<li><a href="#demo-1">Demo 1: description</a></li>-->
                        <!--<li><a href="#demo-2">Demo 2: description</a></li>-->
                        <!--<li><a href="#demo-3">Demo 3: description</a></li>-->
                        <!--<li><a href="#demo-4">Demo 4: description</a></li>-->
                        <li><a href="#license">License</a></li>
                        <li><a href="#credits">Credits</a></li>
                    </ul>
                    <br>
                    <a href="#top" data-role="">Back to top</a>
                </nav>
            </div>
        </div>
    </div>
</main>
<br>
<br>
<footer>
    <div class="jumbotron">
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
                    <div class="col-xs-4">
                        <img src="http://placehold.it/150x150" alt="me" class="img-responsive img-thumbnail">
                    </div>
                    <div class="col-xs-8">
                        <address>
                            <strong>Travis Clarke</strong><br>
                            <a href="mailto:#"> travis.m.clarke@gmail.com</a><br>
                            (123) 456-7890
                        </address>
                    </div>
                </div>
                <div class="col-sm-4">
                    <h5 class="text-center">Coming Soon!</h5>
                </div>
                <div class="col-sm-4">
                    <h5 class="text-center">Coming Soon!</h5>
                </div>
            </div>
        </div>
    </div>
</footer>


<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/Bootstrap/bootstrap.js"></script>
<script type="text/javascript" src="js/bootstrap-autohidingnavbar/jquery.bootstrap-autohidingnavbar.js"></script>
<script type="text/javascript" src="js/ZeroClipboard/ZeroClipboard.js"></script>
<script type="text/javascript" src="js/js-xlsx/xlsx.core.min.js"></script>
<script type="text/javascript" src="js/Blob.js/Blob.js"></script>
<script type="text/javascript" src="js/FileSaver.js/FileSaver.js"></script>
<script type="text/javascript" src="js/Export2Excel.js"></script>
<!--<script type="text/javascript" src="js/TableExport.js/jquery.tableexport.js"></script>-->
<script type="text/javascript" src="js/TableExport.js/jquery.tableexport.v2.js"></script>
<script type="text/javascript" src="js/main.js"></script>


</body>
</html>


