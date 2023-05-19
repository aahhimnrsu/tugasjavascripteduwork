<?php
include 'conn.php';
$id = $_GET['id'];

$query = mysqli_query($koneksi,"SELECT * FROM customer where id='$id'");
?>
<!doctype html>
<html lang="en">

<head>
    <title>Data Customer</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>

<body>
    <!-- Menampilkan data order dan customer dalam tabel menggunakan bootstrap -->
    <div class="container">
    <?php
        while($data = mysqli_fetch_array($query)){
            ?>
        <div class="m-5 shadow-lg p-3 mb-5 bg-body-tertiary rounded">
            <h1 class="text-center">Edit Data</h1>
            <form id="form_tambah" action="proses_edit.php?id=<?= $data['id']?>" method="post">
                <div class="form-group mb-3">
                    <div class="form-label">Nama Depan</div>
                    <input type="text" name="first_name" data-name="Nama Depan" class="required form-control" value="<?= $data['first_name']?>">
                </div>
                <div class="form-group mb-3">
                    <div class="form-label">Nama Belakang</div>
                    <input type="text" name="last_name" data-name="Nama Belakang" class="required form-control" value="<?= $data['last_name']?>">
                </div>
                <div class="form-group mb-3">
                    <div class="form-label">Email</div>
                    <input type="text" name="email" data-name="Email" class="required form-control" value="<?= $data['email']?>">
                </div>
                <div class="form-group mb-3">
                    <div class="form-label">HP</div>
                    <input type="text" name="phone" data-name="HP" class="required form-control" value="<?= $data['phone']?>">
                </div>
                <div class="form-group mb-3">
                    <div class="form-label">Alamat</div>
                    <textarea name="address" data-name="Alamat" class="required form-control"><?= $data['address']?></textarea>
                </div>
                <div class="d-flex justify-content-between mb-3">
                    <a href="index.php" class="btn btn-danger btn-sm"><i class="bi bi-chevron-left"></i> Kembali</a>
                    <input type="submit" name="Submit" value="Edit Data" class="btn btn-warning btn-sm">
                </div>
                </tbody>
                </table>
            </form>
        </div>
        <?php }
                ?>
    </div>

        <script>
            $(document).ready(function() {
                $('#form_tambah').submit(function(e) {
                    e.preventDefault(); // Mencegah pengiriman form

                    // Menghapus pesan error yang mungkin ada
                    $('.error').remove();

                    // Cek setiap input dengan class "required"
                    $('.required').each(function() {
                        if ($(this).val() === '') {
                            // Mendapatkan nama kolom dari atribut data-name
                            var columnName = $(this).data('name');

                            // Jika input kosong, tambahkan pesan error dan beri warna merah di kolomnya
                            $(this).after('<div class=" form-text error text-danger" style="font-size: 12px;">' + columnName + ' tidak boleh kosong</div>');
                            $(this).css('border-color', 'red');
                        }
                    });

                    // Jika tidak ada input yang kosong, submit form
                    if ($('.error').length === 0) {
                        $(this).unbind('submit').submit();
                    }
                });

                // Menghapus pesan error dan warna merah saat input diubah
                $('.required').keyup(function() {
                    $(this).next('.error').remove();
                    $(this).css('border-color', '');
                });
            });
        </script>
</body>

</html>