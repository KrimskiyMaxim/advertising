function change_select(e) {
    $('#table-content').load('/statistic/group?group='+$(e).val()+' #table-content');
}