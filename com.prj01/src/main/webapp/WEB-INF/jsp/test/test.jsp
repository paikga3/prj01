<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>테스트</title>
<script src="js/jquery-3.1.1.js"></script>
<script src="js/inputmask/inputmask.js"></script>
<!-- <script src="js/inputmask/inputmask.numeric.extensions.js"></script> -->
<script src="js/inputmask/jquery.inputmask.js"></script>
<script type="text/javascript">
(function($) {
	  $.fn.caret = function(pos) {
	    var target = this[0];
	    var isContentEditable = target && target.contentEditable === 'true';
	    if (arguments.length == 0) {
	      //get
	      if (target) {
	        //HTML5
	        if (window.getSelection) {
	          //contenteditable
	          if (isContentEditable) {
	            target.focus();
	            var range1 = window.getSelection().getRangeAt(0),
	                range2 = range1.cloneRange();
	            range2.selectNodeContents(target);
	            range2.setEnd(range1.endContainer, range1.endOffset);
	            return range2.toString().length;
	          }
	          //textarea
	          return target.selectionStart;
	        }
	        //IE<9
	        if (document.selection) {
	          target.focus();
	          //contenteditable
	          if (isContentEditable) {
	              var range1 = document.selection.createRange(),
	                  range2 = document.body.createTextRange();
	              range2.moveToElementText(target);
	              range2.setEndPoint('EndToEnd', range1);
	              return range2.text.length;
	          }
	          //textarea
	          var pos = 0,
	              range = target.createTextRange(),
	              range2 = document.selection.createRange().duplicate(),
	              bookmark = range2.getBookmark();
	          range.moveToBookmark(bookmark);
	          while (range.moveStart('character', -1) !== 0) pos++;
	          return pos;
	        }
	        // Addition for jsdom support
	        if (target.selectionStart)
	          return target.selectionStart;
	      }
	      //not supported
	      return;
	    }
	    //set
	    if (target) {
	      if (pos == -1)
	        pos = this[isContentEditable? 'text' : 'val']().length;
	      //HTML5
	      if (window.getSelection) {
	        //contenteditable
	        if (isContentEditable) {
	          target.focus();
	          window.getSelection().collapse(target.firstChild, pos);
	        }
	        //textarea
	        else
	          target.setSelectionRange(pos, pos);
	      }
	      //IE<9
	      else if (document.body.createTextRange) {
	        if (isContentEditable) {
	          var range = document.body.createTextRange();
	          range.moveToElementText(target);
	          range.moveStart('character', pos);
	          range.collapse(true);
	          range.select();
	        } else {
	          var range = target.createTextRange();
	          range.move('character', pos);
	          range.select();
	        }
	      }
	      if (!isContentEditable)
	        target.focus();
	    }
	    return this;
	  }
	})(jQuery);
	$(document).ready(function() {
		
		$('#t').inputmask("9{1,}");  //static mask */
		
		$('#tt').on('input', function(e) {
			
			var inputVal = $('#tt').val();
			$('#tt').val(inputVal.replace(/[^0-9]/gi,''));
			
		});
		$('#tt').keydown(function(e) {
			var caret = $(this).caret();
			if((e.which >= 48 && e.which <=57) || (e.which>=96 && e.which<=105)) {
				setTimeout(function() {
					$('#tt').caret(caret + 1);
				}, 0);
				return true;
			} else {
				switch(e.which) {
					case 8:
					case 13:
					case 16:
					case 37:
					case 39:
						return true;
				}
				setTimeout(function() {
					$('#tt').caret(caret);
				}, 0);
				return false;
			}
		});
		

	});
</script>
</head>
<body>
<label for="t">커스텀이벤트</label><input type="text" id="t"/>
<label for="tt">기존이벤트</label><input type="text" id="tt"/>
</body>
</html>