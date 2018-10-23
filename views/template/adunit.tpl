    <div class="container">
        <div class="row">
            <div class="col-12 col-lg-6 text-center text-lg-left fs-40">
                Рекламные-блоки
            </div>
            <div class="col-12 col-lg-6 text-center text-lg-right">
                <button class="btn btn-info mb-3" onclick="$('#modal_add').modal()">Добавить рекламный блок</button>
            </div>
        </div>
        <div class="table-responsive">
        <table class="table">
            <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Название</th>
                <th scope="col">Интернет-ресурс</th>
                <th scope="col">Описание</th>
                <th scope="col" class="text-right">Действие</th>
            </tr>
            </thead>
            <tbody>
            <?php foreach ($content as $item): ?>
                <tr>
                    <th resource_id="<?php echo($item['id']); ?>" scope="row"><?php echo($item['id']); ?></th>
                    <td><?php echo($item['name']); ?></td>
                    <td>#<?php echo($item['resource_id']); ?>, <?php echo($item['contact']); ?>,
                        <a href="<?php echo($item['url']);?>"><?php echo($item['url']);?></a></td>
                    <td><?php echo($item['description']); ?></td>
                    <td class="text-right">
                        <a class="ml-2" href="statistic/click?id=<?php echo($item['id']); ?>"><i class="fas fa-signature"  data-toggle="tooltip" data-placement="top" title="Статистика кликов"></i></a>
                        <a class="ml-2" href="statistic/view?id=<?php echo($item['id']); ?>"><i class="fas fa-eye"  data-toggle="tooltip" data-placement="top" title="Статистика показов"></i></a>
                        <i class="fas fa-copy ml-2"  data-toggle="tooltip" data-placement="top" title="Скопировать JS" onclick="copy_js(this)"></i>
                        <textarea style="width: 0px; height: 0px; position: absolute; top: -9999px;">
                            <script>var id="<?php echo($item['id']); ?>",request=function(e,n){var t=new XMLHttpRequest;t.open("GET",e,!0),t.responseType="json",t.onload=function(){n(t.response)},t.send()};request("http://ip-api.com/json",function(e){request("//advertising/API/view?adunit_id="+id+"&query="+e.query+"&countryCode="+e.countryCode);var n=document.createElement("div");n.innerHTML="<div onclick=\"request('//advertising/API/click?adunit_id="+id+"&query="+e.query+"&countryCode="+e.countryCode+"')\" style='width: 200px; height:200px; background: red; position: absolute; right:0; top:0;'>реклама</div>",document.body.appendChild(n)});</script>
                        </textarea>
                        <i class="fas fa-edit ml-2"  data-toggle="tooltip" data-placement="top" title="Изменить" onclick="modal_edit('<?php echo($item['id']); ?>')"></i>
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
                    <button type="button" class="btn btn-danger" id="submit_delete" onclick="adunit_delete()">Подтвердить</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modal_add">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <form id="form_adunit_add" class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Добавить рекламный блок</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" >Название</span>
                        </div>
                        <input type="text" class="form-control" id="add-name" name="add-name">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" >Описание</span>
                        </div>
                        <input type="text" class="form-control" id="add-description" name="add-description">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Интернет-ресурс</span>
                        </div>
                        <select class="custom-select" id="add-resource" name="add-resource">
                            <option value="0" selected>Выбрать...</option>
                            <?php foreach ($resources as $item):?>
                            <option value="<?php echo($item['id']);?>">#<?php echo($item['id']);?>, <?php echo($item['contact']);?>, <?php echo($item['url']);?></option>
                            <?php endforeach;?>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Отмена</button>
                    <button type="button" class="btn btn-info" id="submit_add" onclick="submit_adunit_add()">Подтвердить</button>
                </div>
            </form>
        </div>
    </div>

    <div class="modal fade" id="modal_edit">
        <div class="modal-dialog modal-dialog-centered">
            <form id="form_adunit_edit" class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Изменить рекламный блок</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" >Название</span>
                        </div>
                        <input type="text" class="form-control" id="edit-name" name="edit-name" placeholder="">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" >Описание</span>
                        </div>
                        <input type="text" class="form-control" id="edit-description" name="edit-description">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Интернет-ресурс</span>
                        </div>
                        <select class="custom-select" id="edit-resource" name="edit-resource">
                            <?php foreach ($resources as $item):?>
                            <option value="<?php echo($item['id']);?>">#<?php echo($item['id']);?>, <?php echo($item['contact']);?>, <?php echo($item['url']);?></option>
                            <?php endforeach;?>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Отмена</button>
                    <button type="button" class="btn btn-info" id="submit_edit" onclick="submit_adunit_edit()">Подтвердить</button>
                </div>
            </form>
        </div>
    </div>
