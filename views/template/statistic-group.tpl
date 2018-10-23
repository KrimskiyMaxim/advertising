    <div class="container">
        <div class="row">
            <div class="col-12 col-lg-6 text-center text-lg-left fs-40">
                Статисткика
            </div>
            <div class="col-12 col-lg-6 text-center text-lg-right">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <label class="input-group-text" for="select-group">Группировать</label>
                    </div>
                    <select onchange="change_select(this)" class="custom-select" id="select-group">
                        <option value="1" selected>Дата</option>
                        <option value="2">Рекламный блок</option>
                        <option value="3">Интернет ресурс</option>
                        <option value="4">Код страны</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="table-responsive" id="table-content">
        <table class="table">
            <thead>
            <tr>
                <th scope="col"><?php echo($group_text); ?></th>
                <th scope="col">Кол-во показов</th>
                <th scope="col">Кол-во кликов</th>
            </tr>
            </thead>
            <tbody>
                <?php foreach ($content as $key => $item): ?>
                <tr>
                    <th scope="row"><?php echo($key); ?></th>
                    <td><?php echo($item['view']); ?></td>
                    <td><?php if (isset($item['click'])) echo($item['click']); else echo('0'); ?></td>
                </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
        </div>
    </div>