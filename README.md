# İl İlçe Seçici

Bu kütüphane Türkiyenin il ve ilçelerini hızlıca şeçtirtmek için yapılmıştır.

![](https://github.com/Firesoftyazilim/il_ilce/blob/main/il_ilce.gif)




## Kurulum

Terminalde çalıştırın.

```bash
flutter pub add il_ilce
```

## Kullanım

### Drop Down Widget
![](https://github.com/Firesoftyazilim/il_ilce/blob/main/widget.png)



```dart
IlIlceController controller = IlIlceController();

IlIlceDropDown(
          controller: controller,
  ),
```
### Search Dialog
![](https://github.com/Firesoftyazilim/il_ilce/blob/main/dialog.png)



```dart

String? arananIl;
String? arananIlce ;

/// il arama dialogu
ElevatedButton(onPressed: () async {
final value = await IlIlceDialog.instance.selectIl(context);
setState(() {
arananIl = value;
print(value);
});
}, child: Text(arananIl??"İl Ara")),

/// il seçme dialogu
ElevatedButton(
onPressed: () {
if(arananIl==null){
return;
}
IlIlceDialog.instance.selectIlce(context,il:arananIl).then((value) {
setState(() {
arananIlce = value;
});
});}

, child: Text(arananIlce??"İlçe Ara"))

```



## License

[MIT](https://choosealicense.com/licenses/mit/)