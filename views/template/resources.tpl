    <div class="container">
        <div class="row">
            <div class="col-12 col-lg-6 text-center text-lg-left fs-40">
                Интернет-ресурсы
            </div>
            <div class="col-12 col-lg-6 text-center text-lg-right">
                <button class="btn btn-info mb-3" onclick="$('#modal_add').modal()">Добавить ресурс</button>
            </div>
        </div>
        <div class="table-responsive">
        <table class="table">
            <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Адрес сайта</th>
                <th scope="col">Тематика</th>
                <th scope="col">Контакты</th>
                <th scope="col" class="text-right">Действие</th>
            </tr>
            </thead>
            <tbody>
            <?php foreach ($content as $item): ?>
                <tr>
                    <th resource_id="<?php echo($item['id']); ?>" scope="row"><?php echo($item['id']); ?></th>
                    <td><a href="<?php echo($item['url']); ?>"><?php echo($item['url']); ?></a></td>
                    <td><?php echo($item['subject_name']); ?></td>
                    <td><?php echo($item['contact']); ?></td>
                    <td class="text-right">
                        <i class="fas fa-edit"  data-toggle="tooltip" data-placement="top" title="Изменить" onclick="modal_edit('<?php echo($item['id']); ?>')"></i>
                        <i class="fas fa-minus-circle ml-2 text-danger" data-toggle="tooltip" data-placement="top" title="Удалить" onclick="modal_delete('<?php echo($item['id']); ?>')"></i>
                    </th>
                </tr>
            <?php endforeach; ?>
            </tbody>
        </table>
        </div>
        <?php if ($pages > 1): ?>
        <div class="row">
            <div class="col d-flex justify-content-center">
                <nav>
                    <ul class="pagination">
                        <?php for($page = 1; $page <= $pages; $page++): ?>
                        <li class="page-item"><a class="page-link <?php if ($page_active == $page) echo 'text-muted'; ?>" href="./?page=<?php echo($page); ?>"><?php echo($page); ?></a></li>
                        <?php endfor; ?>
                    </ul>
                </nav>
            </div>
        </div>
        <?php endif; ?>
    </div>



    <!-- Modals -->
    <div class="modal fade" id="modal_delete">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Внимание</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Удаление не может быть отменено.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Отмена</button>
                    <button type="button" class="btn btn-danger" id="submit_delete" onclick="resource_delete()">Подтвердить</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modal_add">
        <div class="modal-dialog modal-dialog-centered">
            <form id="form_resource_add" class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Добавить ресурс</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" >Адрес сайта</span>
                        </div>
                        <input type="text" class="form-control" id="add-url" name="add-url" placeholder="URL">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" >Контакт</span>
                        </div>
                        <input type="text" class="form-control" id="add-contact" name="add-contact">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Тематика</span>
                        </div>
                        <select class="custom-select" id="add-subject" name="add-subject">
                            <option value="0" selected>Выбрать...</option>
                            <?php foreach ($subjects as $subject):?>
                            <option value="<?php echo($subject['id']);?>"><?php echo($subject['name']);?></option>
                            <?php endforeach;?>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Отмена</button>
                    <button type="button" class="btn btn-info" id="submit_add" onclick="submit_resource_add()">Подтвердить</button>
                </div>
            </form>
        </div>
    </div>

    <div class="modal fade" id="modal_edit">
        <div class="modal-dialog modal-dialog-centered">
            <form id="form_resource_edit" class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Изменитьы ресурс</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" >Адрес сайта</span>
                        </div>
                        <input type="text" class="form-control" id="edit-url" name="edit-url" placeholder="URL">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" >Контакт</span>
                        </div>
                        <input type="text" class="form-control" id="edit-contact" name="edit-contact">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Тематика</span>
                        </div>
                        <select class="custom-select" id="edit-subject" name="edit-subject">
                            <?php foreach ($subjects as $subject):?>
                            <option value="<?php echo($subject['id']);?>"><?php echo($subject['name']);?></option>
                            <?php endforeach;?>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Отмена</button>
                    <button type="button" class="btn btn-info" id="submit_edit" onclick="submit_resource_edit()">Подтвердить</button>
                </div>
            </form>
        </div>
    </div>
