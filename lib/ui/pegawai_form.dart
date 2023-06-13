import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import '../service/pegawai_service.dart';
import 'pegawai_detail.dart';

class PegawaiForm extends StatefulWidget {
  const PegawaiForm({Key? key}) : super(key: key);
  _PegawaiFormState createState() => _PegawaiFormState();
}

class _PegawaiFormState extends State<PegawaiForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaPegawaiCtrl = TextEditingController();
  final _nipPegawaiCtrl = TextEditingController();
  final _tanggalLahirCtrl = TextEditingController();
  final _nomorTeleponCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Pegawai")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _fieldNamaPegawai(),
              _fieldnipPegawai(),
              _fieldtanggalLahir(),
              _fieldnomorTelepon(),
              _fieldemail(),
              _fieldpassword(),
              const SizedBox(height: 20),
              _tombolSimpan()
            ],
          ),
        ),
      ),
    );
  }

  _fieldNamaPegawai() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Pegawai"),
      controller: _namaPegawaiCtrl,
    );
  }

  _fieldnipPegawai() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nip Pegawai"),
      controller: _nipPegawaiCtrl,
    );
  }

  _fieldtanggalLahir() {
    return TextField(
      decoration: const InputDecoration(labelText: "Tanggal Lahir"),
      controller: _tanggalLahirCtrl,
    );
  }

  _fieldnomorTelepon() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nomor Telepon"),
      controller: _nomorTeleponCtrl,
    );
  }

  _fieldemail() {
    return TextField(
      decoration: const InputDecoration(labelText: "Email"),
      controller: _emailCtrl,
    );
  }

  _fieldpassword() {
    return TextField(
      decoration: const InputDecoration(labelText: "Password"),
      controller: _passwordCtrl,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
      onPressed: () async {
        Pegawai pegawai = new Pegawai(
            namaPegawai: _namaPegawaiCtrl.text,
            nipPegawai: _nipPegawaiCtrl.text,
            tanggalLahir: DateTime.parse(_tanggalLahirCtrl.text),
            nomorTelepon: _nomorTeleponCtrl.text,
            email: _emailCtrl.text,
            password: _passwordCtrl.text);
        await PegawaiService().simpan(pegawai).then((value) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => PegawaiDetail(pegawai: value),
            ),
          );
        });
      },
      child: const Text("Simpan"),
    );
  }
}
