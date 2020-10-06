// $(function() {

//   $("#memo-submit").on('click', (function() {

//     var form = $('#new_memo');

//     form.find("input[type=submit]").prop("disabled", true);

//     // 空のメモを作成
//     var input = {content: $("#memo_content")};
//     console.log(input);

//     input.on('input', function(event) {
//       var value = input.val();

//       $.ajax({ 
//         type: "POST", 
//         contentType: "application/json; charset=utf-8", 
//         url: "AutoSaveService.asmx/AutoSave", 
//         data: value,
//         dataType: "json" 
//       }); 

//     $.post( 'https://httpbin.org/post', 'memo' )

//   }));
// })