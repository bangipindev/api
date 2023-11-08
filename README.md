## INSTALL / UPDATE COMPOSER
Jika Vendor belum terpasang maka lakukan dulu Composer Install atau Composer Update
Jika terdapat package yang error di komputer kamu tambahkan ini saat melakukan composer install --ignore-paltform-reqs

## COPY ISI ENV.EXAMPLE DAN BUAT FILE .ENV baru 
Paste kan isi dari ENV.EXAMPLE ke dalam file .ENV yang baru saja kamu buat

## SESUAIKAN DRIVER CONNECTION KE DATABASE
Silakan sesuaikan sendiri anda akan menggunakan Postgre atau Mysql

## GENERATE KEY
PHP artisan key:generate


======================================================================================================================


## OPTIONAL DOCKER COMPOSE SERVICE
- Jika ingin menggunakan Driver Mysql silakan Aktifkan Service DB Mysql dan Non Aktifkan Yang PostgresSQL
- Jika ingin menggunakan Driver PostgreSQL silakan Aktifkan Service DB PGSQL dan Nonaktifkan yang MySQL

## BUILD DOCKER
Nyalakan Docker Desktop terlebih dahulu (jika menggunakan windows).
Jika sudah Running silakan build dockerfile nya dengan perintah

<pre>docker compose build</pre>

atau jika ingin build semua service bisa langsung menjalankan perintah berikut

<pre>docker compose up</pre>
Tambahkan -d jika tidak ingin menampilkan console debugnya / detach

## ADD EXTRA HOST SENDIRI

Tambahkan Extra Host Sendiri Di Linux jika ingin menggunakan hostname "host.docker.internal" dengan cara

Masuk ke sudo /etc && sudo nano hosts

Tambahkan Script ini 
127.0.0.1 host.docker.internal

Bisa juga diganti IP Bebas,

## JIKA PAKAI WINDOWS & DOCKER DESKTOP
ADD HOST SENDIRI jika tidak di Generate oleh Docker Desktop disini
windows => System32 => Drivers => etc => hosts

Tambahkan Script ini
127.0.0.1 host.docker.internal (paling aman)

Jika menggunakan IP Addres dari Wifi silakan tambahkan script sendiri seperti diatas

## JIKA TIDAK BISA MENGGUNAKAN HOSTNAME DARI IP ADDRESS 
Pastikan IP Address dari kamu sudah sama dengan yang ada di Host. Biasanya jika anda menggunakan Wifi di tempat lain selain saat pertama
kali kamu install docker di Windows maka Host.docker.internal nya akan tercatat IP Address saat menginstall.