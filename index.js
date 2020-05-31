function save(curEle){
  return $.ajax({
      // async: false,
      type: "POST",
      url: "./addToDB.php",
      data: JSON.stringify({formDataOption: getFormData(), textData: getTextData(), uin: uin, currTabName: currTabName}),
      contentType: "application/json; charset=UTF-8",
      success: function(data) {
          console.log("Ajax save executed!");
      }
  });
}
        
var currentTab = 0; // Current tab is set to be the first tab (0)
var currTabName = "";
var formData = "";
showTab(currentTab); // Display the current tab

function showTab(n) {
  // This function will display the specified tab of the form...
  console.log("show tab " + n);
  var x = document.getElementsByClassName("tab");
  if(x.length == 0){
    window.location.href = "test.php";
    return;
  }
  if(n == 0 ) currTabName = $(x[0]).find('h2').html()
  else currTabName = $(x[n]).find('h2').html()
  x[n].style.display = "block";
  //... and fix the Previous/Next buttons:
  // if (n == 0) {
  //   document.getElementById("prevBtn").style.display = "none";
  // } else {
  //   document.getElementById("prevBtn").style.display = "inline";
  // }
  if (n == (x.length - 1)) {
    document.getElementById("nextBtn").innerHTML = "Complete the Tool";
  } else {
    document.getElementById("nextBtn").innerHTML = "Complete this Section";
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
  }
  //... and run a function that will display the correct step indicator:
  fixStepIndicator(n)
}

function nextPrev(n) {
  // Otherwise, display the correct tab:
  //showTab(currentTab);
  // This function will figure out which tab to display
  var x = document.getElementsByClassName("tab");

  // Exit the function if any field in the current tab is invalid:
  if (n == 1 && !validateForm()) return false;

  formData = getFormData();

  // Hide the current tab:
  x[currentTab].style.display = "none";
  // Increase or decrease the current tab by 1:
  currentTab = currentTab + n;
  // if you have reached the end of the form...
  if (currentTab >= x.length) {
    // ... the form gets submitted:
    save(this).then(function(){document.getElementById("testForm").submit()});
    return false;
  }
  save(this).then(function(){showTab(currentTab);});
  ;
  //Get the button
  //var mybutton = document.getElementById("nextBtn");
}


function getFormData(){
  var items = $("#testForm").serializeArray();
  var data = [];
  for(var _i = 0 ; _i < items.length; ++_i){
    var item = items[_i];
    if($("input[name="+ item.name + "]").length > 1 && $("input[name="+ item.name + "]")[0].type == "radio"){
      for(var i = 0 ; i < $("input[name="+ item.name + "]").length; ++i ){
        if($("input[name="+ item.name + "]")[i].checked){
          data.push({name: item.name, option: $("input[name="+ item.name + "]")[i].id})
        }
      }
    } else if ($("select[name="+ item.name + "]").length >= 1 && $("select[name="+ item.name + "]")[0].type == "select-one"){
      for(var i = 0 ; i < $("select[name="+ item.name + "]").length; ++i ){
        var selItem = $("select[name="+ item.name + "]")[i];
        data.push({name: selItem.name, option: selItem.value});
      }
    }
  }
  return data
}

function getTextData(){
  var items = $("#testForm").serializeArray();
  var optionData = getFormData().map(function(item){ return item.name })
  var data = [];
  for(var _i = 0 ; _i < items.length; ++_i){
    var item = items[_i];
    if(!optionData.includes(item.name) && item.value != ""){
      data.push(item)
    }
  }
  return data
}

function minWcta(elem, wc){
  return (elem.value.match(/\S+/g) || "").length >= wc;
}

        

function validateForm() {
  // This function deals with validation of the form fields
    var customValidationMap = {
      'WA_Question78': function(item){
        return minWcta(item, 100);
      },
      'WA_Question79': function(item){return minWcta(item, 250);}
    }

    var x, y, i, valid = true;
    var value;
    x = document.getElementsByClassName("tab");
    y = x[currentTab].getElementsByTagName("input");
    // console.log(y);
    yTextArea = x[currentTab].getElementsByTagName("textarea");
    // console.log(yTextArea);
    
    // Check for radio button validation 
    var check = true;
    var name ;
    var radio__ = x[currentTab].getElementsByTagName("input");
    var radio_ = [];
    for(var i=0; i < radio__.length; ++i){
      if(radio__[i].type=="radio"){
        radio_.push(radio__[i]);
      }
    }

    for(var k in customValidationMap){
      if($("#" + k).length){
        for(var i = 0; i< $("#" + k).length; ++i){
          var item = $("#" + k)[i];
          console.log(customValidationMap[k](item));
          check = check && customValidationMap[k](item);
        }
      }
    }
    console.log(check);

    for(var i=0; i<radio_.length; ++i){
      var item = radio_[i];
      name = $(item).attr("name");
      console.log(name);
      if($("input:radio[name="+name+"]:checked").length == 0){
          check = false;
          console.log("in there");
      }
    }

    var sel = $("select")
    for(var i = 0; i < sel.length; ++i){
      var item = sel[i];
      if(item.value == "none"){
        valid = false;
        check = false;
      }
    }

          
    if(check){
        // if checked return valid = True
      valid = true;  
    }else{
        // if unchecked alert and return valid = False
        // swal("Error", "You left 1 or more Question unanswered. Please select one option in the unanswered questions.", "error");
        swal({
          title: "Error",
          text: "You left 1 or more Question(s) unanswered. Please select one option in the unanswered questions.",
          icon: "error",
          buttons: {
            confirm: {
              text: 'Ok', className: 'sweet-error'
            }
          }
        });
        // console.log(name);
        valid=false;
    }

    // A loop that checks every input field in the current tab:
    for (i = 0; i < y.length; i++) {
      // If a field is empty...
      if (y[i].value == "") {
        // add an "invalid" class to the field:
        y[i].className += " invalid";
        // and set the current valid status to false
        valid = false;
      }
    }
    
    // A loop that checks every Text Area input field in the current tab:
    for (i = 0; i < yTextArea.length; i++) {
      // If a field is empty...
      if (yTextArea[i].value == "") {
        // add an "invalid" class to the field:
        yTextArea[i].className += " invalid";
        // and set the current valid status to false
        valid = false;
      }
    }


    // If the valid status is true, mark the step as finished and valid:
    if (valid) {
      document.getElementsByClassName("step")[currentTab].className += " finish";
    }
    return valid; // return the valid status
  }
        
  function fixStepIndicator(n) {
    // This function removes the "active" class of all steps...
    var i, x = document.getElementsByClassName("step");
    for (i = 0; i < x.length; i++) {
      x[i].className = x[i].className.replace(" active", "");
    }
    //... and adds the "active" class on the current step:
    x[n].className += " active";
  }