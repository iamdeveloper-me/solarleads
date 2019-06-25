$(function(){
	$("#wizard").steps({
        headerTag: "h4",
        bodyTag: "section",
        transitionEffect: "fade",
        enableAllSteps: true,
        transitionEffectSpeed: 300,
        labels: {
            next: "Next",
            previous: "Prev"
        },
        onStepChanging: function (event, currentIndex, newIndex) { 
            if ( newIndex === 1 ) {
                $('.steps').addClass('step-2');
            } else {
                $('.steps').removeClass('step-2');
            }
            if ( newIndex === 2 ) {
                $('.steps').addClass('step-3');
            } else {
                $('.steps').removeClass('step-3');
            }
            if ( newIndex === 3 ) {
                $('.steps').addClass('step-4');
            } else {
                $('.steps').removeClass('step-4');
            }
            if ( newIndex === 4 ) {
                $('.steps').addClass('step-5');
            } else {
                $('.steps').removeClass('step-5');
            }
            if ( newIndex === 5 ) {
                $('.steps').addClass('step-6');
            } else {
                $('.steps').removeClass('step-6');
            }
            if ( newIndex === 6 ) {
                $('.steps').addClass('step-7');
            } else {
                $('.steps').removeClass('step-7');
            }
            if ( newIndex === 7 ) {
                $('.steps').addClass('step-8');
            } else {
                $('.steps').removeClass('step-8');
            }
            if ( newIndex === 8 ) {
                $('.steps').addClass('step-9');
            } else {
                $('.steps').removeClass('step-9');
            }
            if ( newIndex === 9 ) {
                $('.steps').addClass('step-10');
            } else {
                $('.steps').removeClass('step-10');
            }
            if ( newIndex === 10 ) {
                $('.steps').addClass('step-11');
            } else {
                $('.steps').removeClass('step-11');
            }
            if ( newIndex === 11 ) {
                $('.steps').addClass('step-12');
            } else {
                $('.steps').removeClass('step-12');
            }
            if ( newIndex === 12 ) {
                $('.steps').addClass('step-13');
            } else {
                $('.steps').removeClass('step-13');
            }
            if ( newIndex === 13 ) {
                $('.steps').addClass('step-14');
            } else {
                $('.steps').removeClass('step-14');
            }
            if ( newIndex === 14 ) {
                $('.steps').addClass('step-15');
            } else {
                $('.steps').removeClass('step-15');
            }
            if ( newIndex === 15 ) {
                $('.steps').addClass('step-16');
            } else {
                $('.steps').removeClass('step-16');
            }
            if ( newIndex === 16 ) {
                $('.steps').addClass('step-17');
            } else {
                $('.steps').removeClass('step-17');
            }
            if ( newIndex === 17 ) {
                $('.steps').addClass('step-18');
            } else {
                $('.steps').removeClass('step-18');
            }
            if ( newIndex === 18 ) {
                $('.steps').addClass('step-19');
            } else {
                $('.steps').removeClass('step-19');
            }
            if ( newIndex === 19 ) {
                $('.steps').addClass('step-20');
            } else {
                $('.steps').removeClass('step-20');
            }
            if ( newIndex === 20 ) {
                $('.steps').addClass('step-21');
            } else {
                $('.steps').removeClass('step-21');
            }
            if ( newIndex === 21 ) {
                $('.steps').addClass('step-22');
            } else {
                $('.steps').removeClass('step-22');
            }
            if ( newIndex === 22 ) {
                $('.steps').addClass('step-23');
            } else {
                $('.steps').removeClass('step-23');
            }
            if ( newIndex === 23 ) {
                $('.steps').addClass('step-24');
            } else {
                $('.steps').removeClass('step-24');
            }
            if ( newIndex === 24 ) {
                $('.steps').addClass('step-25');
            } else {
                $('.steps').removeClass('step-25');
            }
            if ( newIndex === 25 ) {
                $('.steps').addClass('step-26');
            } else {
                $('.steps').removeClass('step-26');
            }
            if ( newIndex === 26 ) {
                $('.steps').addClass('step-27');
            } else {
                $('.steps').removeClass('step-27');
            }

            if ( newIndex === 27 ) {
                $('.steps').addClass('step-28');
            } else {
                $('.steps').removeClass('step-28');
            }
            if ( newIndex === 28 ) {
                $('.steps').addClass('step-29');
            } else {
                $('.steps').removeClass('step-29');
            }
            return true; 
        }
    });
    // Custom Jquery Steps
    $('.forward').click(function(){
    	$("#wizard").steps('next');
    })
    $('.backward').click(function(){
        $("#wizard").steps('previous');
    })
    // Select
    $('html').click(function() {
        $('.select .dropdown').hide(); 
    });
    $('.select').click(function(event){
        event.stopPropagation();
    });
    $('.select .select-control').click(function(){
        $(this).parent().next().toggle().toggleClass('active');
    })
    $('.select .dropdown li').click(function(){
        $(this).parent().toggle();
        var text = $(this).attr('rel');
        $(this).parent().prev().find('div').text(text);
    })
    // Payment
    $('.payment-block .payment-item').click(function(){
        $('.payment-block .payment-item').removeClass('active');
        $(this).addClass('active');
    })
    // Date Picker
    // var dp1 = $('#dp1').datepicker().data('datepicker');
})
