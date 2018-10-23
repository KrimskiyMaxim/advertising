function submit_resource_add() {
    var data = {};
    $.each(form_data = $("#form_resource_add").serializeArray(), function(index, obj){
        data[obj.name] = obj.value;
    });

    var errors = {};
    if(data['add-url'] == 0){
        errors['add-url'] = true;
    }
    if(data['add-contact'] == 0){
        errors['add-contact'] = true;
    }
    if(data['add-subject'] == 0){
        errors['add-subject'] = true;
    }

    $("#form_resource_add .input-group").removeAttr('style');
    if(!$.isEmptyObject(errors)){
        $.each(errors, function (key, item) {
           $('#'+key).parent().css({'border':'1px solid red', 'border-radius':'4px'});
        });
        return;
    }

    $.ajax({
        type: 'POST',
        url: 'resources/add',
        dataType: 'html',
        data: form_data,
        beforeSend: function () {
            $('#submit_add').removeAttr('onclick');
        },
        success: function(data){
            if(data != 'true') {
                console.log('Error');
                console.log(data);
                return
            }
            location.reload();
        }
    });
}
function modal_delete(id) {
    $('#modal_delete').attr('resource_id', id);
    $('#modal_delete').modal();
}
function resource_delete() {
    id = $('#modal_delete').attr('resource_id')
    $.ajax({
        type: 'POST',
        url: 'resources/delete',
        dataType: 'html',
        data: {'resource_id' : id},
        success: function(data){
            $('th[resource_id='+id+']').parent().remove();
            $('#modal_delete').modal('hide');
        }
    });
}
function modal_edit(id) {
    $.ajax({
        type: 'POST',
        url: 'resources/id',
        dataType: 'html',
        data: {'edit-id' : id},
        success: function(data){
            data = JSON.parse(data);
            data = data[0];
            $('#edit-url').val(data['url']);
            $('#edit-contact').val(data['contact']);
            $('#edit-subject option[value='+data['subject_id']+']').attr('selected', true);
        }
    });
    $('#modal_edit').attr('resource_id', id);
    $('#modal_edit').modal();
}
function submit_resource_edit() {
    var data = {};
    $.each(form_data = $("#form_resource_edit").serializeArray(), function(index, obj){
        data[obj.name] = obj.value;
    });
    data['id'] = $('#modal_edit').attr('resource_id');

    var errors = {};
    if(data['edit-url'] == 0){
        errors['edit-url'] = true;
    }
    if(data['edit-contact'] == 0){
        errors['edit-contact'] = true;
    }
    if(data['edit-subject'] == 0){
        errors['edit-subject'] = true;
    }

    $("#form_resource_edit .input-group").removeAttr('style');
    if(!$.isEmptyObject(errors)){
        $.each(errors, function (key, item) {
            $('#'+key).parent().css({'border':'1px solid red', 'border-radius':'4px'});
        });
        return;
    }

    $.ajax({
        type: 'POST',
        url: 'resources/edit',
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