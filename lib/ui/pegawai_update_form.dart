import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import '../service/pegawai_service.dart';
import 'pegawai_detail.dart';

class PegawaiUpdateForm extends StatefulWidget {
  final Pegawai pegawai;

  const PegawaiUpdateForm({Key? key, required this.pegawai}) : super(key: key);
  _PegawaiUpdateFormState createState() => _PegawaiUpdateFormState();
}

class _PegawaiUpdateFormState extends State<PegawaiUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaPegawaiCtrl = TextEditingController();
  final _nipPegawaiCtrl = TextEditingController();
  final _tanggalLahirCtrl = TextEditingController();
  final _nomorTeleponCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  Future<Pegawai> getData() async {
    Pegawai data = await PegawaiService().getById(widget.pegawai.id.toString());
    setState(() {
      if (data.namaPegawai != null) {
        _namaPegawaiCtrl.text = data.namaPegawai;
      }
      if (data.nipPegawai != null) {
        _nipPegawaiCtrl.text = data.nipPegawai;
      }
      DateTime? tanggalLahir;
      if (tanggalLahir != null) {
        // Kode yang akan dijalankan jika tanggalLahir tidak null
        print('Tanggal lahir: $tanggalLahir');
      } else {
        // Kode yang akan dijalankan jika tanggalLahir null
        print('Tanggal lahir tidak tersedia');
      }
      if (data.nomorTelepon != null) {
        _nomorTeleponCtrl.text = data.nomorTelepon;
      }
      if (data.email != null) {
        _emailCtrl.text = data.email;
      }
      if (data.password != null) {
        _passwordCtrl.text = data.password;
      }
    });
    return data;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Pegawai")),
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

  _fieldIdPegawai() {
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
        String id = widget.pegawai.id.toString();
        await PegawaiService().ubah(pegawai, id).then((value) {
          Navigator.pop(context);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => PegawaiDetail(pegawai: value),
            ),
          );
        });
      },
      child: const Text("Simpan Perubahan"),
    );
  }
}
