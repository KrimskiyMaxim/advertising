    <div class="container">
    <div class="row">
        <div class="col fs-40">
            <?php echo($text_top); ?>
        </div>
    </div>
        <div class="row mb-3">
            <div class="col">
                Всего записей - <?php echo($quantity); ?>
            </div>
        </div>
        <div class="table-responsive">
        <table class="table">
            <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Интернет-ресурс</th>
                <th scope="col">Рекламный блок</th>
                <th scope="col">Дата показа</th>
                <th scope="col">IP адрес</th>
                <th scope="col">Код страны</th>
            </tr>
            </thead>
            <tbody>
            <?php foreach ($content as $item): ?>
                <tr>
                    <th resource_id="<?php echo($item['id']); ?>" scope="row"><?php echo($item['id']); ?></th>
                    <td><?php echo($item['resources_id']); ?></td>
                    <td><?php echo($item['adunit_id']); ?></td>
                    <td><?php echo gmdate("Y-m-d H:i:s", $item['date']); ?></td>
                    <td><?php echo($item['IP']); ?></td>
                    <td><?php echo($item['ISO']); ?></td>
                </tr>
            <?php endforeach; ?>
            </tbody>
        </table>
        </div>
    </div>