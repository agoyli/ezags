
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
            $(this).data('datepicker').selectDate(val.toDate());
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

    initAutocompletes()


});

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
            return false;
        }
    });
}
