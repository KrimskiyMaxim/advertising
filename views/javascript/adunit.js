function submit_adunit_add() {
    var data = {};
    $.each(form_data = $("#form_adunit_add").serializeArray(), function(index, obj){
        data[obj.name] = obj.value;
    });

    var errors = {};
    if(data['add-name'] == 0){
        errors['add-name'] = true;
    }
    if(data['add-description'] == 0){
        errors['add-description'] = true;
    }
    if(data['add-resource'] == 0){
        errors['add-resource'] = true;
    }

    $("#form_adunit_add .input-group").removeAttr('style');
    if(!$.isEmptyObject(errors)){
        $.each(errors, function (key, item) {
            $('#'+key).parent().css({'border':'1px solid red', 'border-radius':'4px'});
        });
        return;
    }

    $.ajax({
        type: 'POST',
        url: 'adunit/add',
        dataType: 'html',
        data: form_data,
        beforeSend: function () {
            $('#submit_add').removeAttr('onclick');
        },
        success: function(data){
            console.log(data);
            if(data != 'true') {
                console.log('Error');
                return
            }
            location.reload();
        }
    });
}
function modal_edit(id) {
    $.ajax({
        type: 'POST',
        url: 'adunit/id',
        dataType: 'html',
        data: {'adunit_id' : id},
        success: function(data){
            data = JSON.parse(data);
            data = data[0];
            $('#edit-name').val(data['name']);
            $('#edit-description').val(data['description']);
            $('#edit-resource option[value='+data['resource_id']+']').attr('selected', true);
        }
    });
    $('#modal_edit').attr('adunit_id', id);
    $('#modal_edit').modal();
}
function submit_adunit_edit() {
    var data = {};
    $.each(form_data = $("#form_adunit_edit").serializeArray(), function(index, obj){
        data[obj.name] = obj.value;
    });
    data['id'] = $('#modal_edit').attr('adunit_id');

    var errors = {};
    if(data['edit-name'] == 0){
        errors['edit-name'] = true;
    }
    if(data['edit-description'] == 0){
        errors['edit-description'] = true;
    }
    if(data['edit-resource'] == 0){
        errors['edit-resource'] = true;
    }

    $("#form_adunit_edit .input-group").removeAttr('style');
    if(!$.isEmptyObject(errors)){
        $.each(errors, function (key, item) {
            $('#'+key).parent().css({'border':'1px solid red', 'border-radius':'4px'});
        });
        return;
    }

    $.ajax({
        type: 'POST',
        url: 'adunit/edit',
        dataType: 'html',
        data: data,
        beforeSend: function () {
            $('#submit_edit').removeAttr('onclick');
        },
        success: function(data){
            if(data != 'true') {
                console.log('Error');
                return
            }
            location.reload();
        }
    });
}
function modal_delete(id) {
    $('#modal_delete').attr('adunit_id', id);
    $('#modal_delete').modal();
}
function adunit_delete() {
    id = $('#modal_delete').attr('adunit_id')
    $.ajax({
        type: 'POST',
        url: 'adunit/delete',
        dataType: 'html',
        data: {'adunit_id' : id},
        success: function(data){
            $('th[resource_id='+id+']').parent().remove();
            $('#modal_delete').modal('hide');
        }
    });
}
function copy_js(e) {

    $(e).next().select();
    document.execCommand('copy');

    alert('Скопировано');
}