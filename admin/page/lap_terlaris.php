<form class="form-inline hidden-print" action="<?=$_SERVER["REQUEST_URI"]?>" method="post">
	<label>Periode</label>
	<input type="text" class="form-control" name="start">
	<label>s/d</label>
	<input type="text" class="form-control" name="stop">
	<button type="submit" class="btn btn-primary btn-sm">Tampilkan</button>
</form>
<br>
<?php if ($_POST): ?>
<div class="panel panel-info">
		<div class="panel-heading"><h3 class="text-center">LAPORAN PENYEWAAN TERLARIS PERPERIODE</h3></div>
		<div class="panel-body">
				<table class="table table-condensed">
						<thead>
								<tr>
										<th>No</th>
										<th>Nama</th>
										<th>Nomor</th>
										<th>alamat_fasilitas</th>
										<th>Total Penyewa</th>
								</tr>
						</thead>
						<tbody>
								<?php $no = 1; ?>
								<?php if ($query = $connection->query("SELECT m.no_fasilitas, m.alamat_fasilitas, m.nama_fasilitas, (SELECT COUNT(*) FROM transaksi WHERE id_fasilitas=t.id_fasilitas) AS jml FROM transaksi t JOIN fasilitas m USING(id_fasilitas) WHERE t.tgl_sewa BETWEEN '$_POST[start]' AND '$_POST[stop]'")): ?>
										<?php while($row = $query->fetch_assoc()): ?>
										<tr>
												<td><?=$no++?></td>
												<td><?=$row['nama_fasilitas']?></td>
												<td><?=$row['no_fasilitas']?></td>
												<td><?=$row['alamat_fasilitas']?></td>
												<td><?=$row['jml']?></td>
										</tr>
										<?php endwhile ?>
								<?php endif ?>
						</tbody>
				</table>
		</div>
    <div class="panel-footer hidden-print">
        <a onClick="window.print();return false" class="btn btn-primary"><i class="glyphicon glyphicon-print"></i></a>
    </div>
</div>
<?php endif; ?>