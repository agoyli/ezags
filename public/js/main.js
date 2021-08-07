
$(document).ready(function () {
    // Можно выбрать тольо даты, идущие за сегодняшним днем, включая сегодня
    $.fn.datepicker.language['tm'] =  {
        days: ['Ýekşenbe','Duşenbe','Sişenbe','Çarşenbe','Penşenbe','Anna','Şenbe'],
        daysShort: ['Ýek','Du','Si','Çar','Pen','An','Şen'],
        daysMin: ['Ýe','Du','Si','Ça','Pe','An','Şe'],
        months: ['Ýanwar','Fewral','Mart','Aprel','Maý','Iýun','Iýul','Awgust','Sentýabr','Oktýabr','Noýabr','Dekabr'],
        monthsShort: ['Ýan','Few','Mart','Apr','Maý','Iýun','Iýul','Awg','Sen','Okt','Noý','Dek'],
        today: 'Şu gün',
        clear: 'Arassalamak',
        dateFormat: 'yyyy-mm-dd',
        timeFormat: 'hh:ii',
        firstDay: 1
    };
    $.fn.datepicker.language['ru'] =  {
        days: ['Воскресенье','Понедельник','Вторник','Среда','Четверг','Пятница','Суббота'],
        daysShort: ['Вос','Пон','Вто','Сре','Чет','Пят','Суб'],
        daysMin: ['Вс','Пн','Вт','Ср','Чт','Пт','Сб'],
        months: ['Январь','Февраль','Март','Апрель','Май','Июнь','Июль','Август','Сентябрь','Октябрь','Ноябрь','Декабрь'],
        monthsShort: ['Янв','Фев','Мар','Апр','Май','Июн','Июл','Авг','Сен','Окт','Ноя','Дек'],
        today: 'Сегодня',
        clear: 'Очистить',
        dateFormat: 'yyyy-mm-dd',
        timeFormat: 'hh:ii',
        firstDay: 1
    };
    $('.airdate').each(function(){
        $(this).datepicker({
            toValue: 'yyyy-mm-dd',
            language: 'tm',
            onSelect: function(formattedDate, date, inst){
                $('#'+(inst.el.getAttribute('id'))).change();
            }
        });

        $(this).attr("autocomplete", "off");
        var val = $(this).val();
        if (val) {
            // val = moment(val);
            // console.log(val);
            // $(this).data('datepicker').selectDate(val.toDate());
        }
    });
    $('.airdatetime').each(function(){
        $(this).datepicker({
            timepicker: true,
            toValue: 'yyyy-mm-dd',
            language: 'tm',
            onSelect: function(formattedDate, date, inst){
                $('#'+(inst.el.getAttribute('id'))).change();
            }
        });

        $(this).attr("autocomplete", "off");
        var val = $(this).val();
        if (val) {
            // val = moment(val);
            $(this).data('datepicker').selectDate(val.toDate());
        }
    });

    $(".is_account").on('change', function () {
        var el = $(this).parent().parent().find('.human-email');
        var elGroup = el.closest('.humanEmailGroup');
        if ($(this).prop('checked'))
            elGroup.show();
        else
            elGroup.hide();
    });

    $("#state").on('change', function () {
        updateRegions();
    });

    initAutocompletes()
    updateRegions();

});

function updateRegions(regionsEl = '#region', statesEl = '#state')
{
    var regionsEl = $(regionsEl);
    var statesEl = $(statesEl);
    regionsEl.html("");
    if (typeof regions[statesEl.val()] !== 'undefined') {
        regionsEl.append('<option></option>');
        regions[statesEl.val()].forEach(function (element) {
            var selected = oldRegion;
            regionsEl.append('<option value="'+element+'" '+(selected === element ? 'selected' : null)+'>'+element+'</option>');
        });
    }
}

function initAutocompletes()
{
    $( ".human-passport" ).autocomplete({
        source: function( request, response ) {
            $.ajax({
                url:routes['human_find'],
                type: 'post',
                dataType: "json",
                data: {
                    _token: CSRF_TOKEN,
                    query: request.term
                },
                success: function( data ) {
                    response( $.map( data.data, function( item ) {
                        return {
                            label: item.passport,
                            value: item
                        }
                    }));
                }
            });
        },
        select: function (event, ui) {
            $(this).val(ui.item.label);
            console.log(ui.item);
            $(this).closest('.human-group').find('.human-id').val(ui.item.value.id);
            $(this).closest('.human-group').find('.human-first-name').val(ui.item.value.first_name);
            $(this).closest('.human-group').find('.human-last-name').val(ui.item.value.last_name);
            $(this).closest('.human-group').find('.human-middle-name').val(ui.item.value.middle_name);
            $(this).closest('.human-group').find('.human-birthday').val(ui.item.value.birthday);
            $(this).closest('.human-group').find('.human-gender').val(ui.item.value.gender);
            console.log(ui.item.value.user);
            if (ui.item.value.user !== null) {
                $(this).closest('.human-group').find('.human-email').val(ui.item.value.user.email);
            }
            return false;
        }
    });
}
