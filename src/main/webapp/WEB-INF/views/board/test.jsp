<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!-- plupload -->


<head>
<script src="${pageContext.request.contextPath}/resources/plupload/js/plupload.full.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plupload/jquery-ui-1.12.1/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/resources/plupload/js/jquery.ui.plupload/jquery.ui.plupload.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/resources/plupload/js/i18n/ko.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plupload/js/jquery.ui.plupload/css/jquery.ui.plupload.css">
<script src="${pageContext.request.contextPath}/resources/plupload/jquery-ui-1.12.1/jquery-ui.min.js"></script>
<link  href="${pageContext.request.contextPath}/resources/plupload/jquery-ui-1.12.1/jquery-ui.min.css" rel="stylesheet">

<script type="text/javascript">
// Initialize the widget when the DOM is ready
$(function() {
    $("#uploader").plupload({
        // General settings
        runtimes : 'html5,flash,silverlight,html4',
        url : "/examples/upload",
 
        // Maximum file size
        max_file_size : '2mb',
 
        chunk_size: '1mb',
 
        // Resize images on clientside if we can
        resize : {
            width : 200,
            height : 200,
            quality : 90,
            crop: true // crop to exact dimensions
        },
 
        // Specify what files to browse for
        filters : [
            {title : "Image files", extensions : "jpg,gif,png"},
            {title : "Zip files", extensions : "zip,avi"}
        ],
 
        // Rename files by clicking on their titles
        rename: true,
         
        // Sort files
        sortable: true,
 
        // Enable ability to drag'n'drop files onto the widget (currently only HTML5 supports that)
        dragdrop: true,
 
        // Views to activate
        views: {
            list: true,
            thumbs: true, // Show thumbs
            active: 'thumbs'
        },
 
        // Flash settings
        flash_swf_url : '/plupload/js/Moxie.swf',
     
        // Silverlight settings
        silverlight_xap_url : '/plupload/js/Moxie.xap'
    });
});
</script>
</head>
<body>
<div id="uploader">
    <p>Your browser doesn't have Flash, Silverlight or HTML5 support.</p>
</div>
</body>