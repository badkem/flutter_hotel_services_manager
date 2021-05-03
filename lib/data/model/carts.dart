import 'dart:convert';

class Carts {
  Carts({
    this.success,
    this.data,
  });

  bool success;
  Data data;

  factory Carts.fromRawJson(String str) => Carts.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Carts.fromJson(Map<String, dynamic> json) => Carts(
        success: json["success"] == null ? null : json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "data": data == null ? null : data.toJson(),
      };
}

class Data {
  Data({
    this.carts,
    this.listLaundryCart,
    this.listFoodCart,
  });

  List<Cart> carts;
  List<ListLaundryCart> listLaundryCart;
  List<ListFoodCart> listFoodCart;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        carts: json["carts"] == null
            ? null
            : List<Cart>.from(json["carts"].map((x) => Cart.fromJson(x))),
        listLaundryCart: json["listLaundryCart"] == null
            ? null
            : List<ListLaundryCart>.from(json["listLaundryCart"]
                .map((x) => ListLaundryCart.fromJson(x))),
        listFoodCart: json["listFoodCart"] == null
            ? null
            : List<ListFoodCart>.from(
                json["listFoodCart"].map((x) => ListFoodCart.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "carts": carts == null
            ? null
            : List<dynamic>.from(carts.map((x) => x.toJson())),
        "listLaundryCart": listLaundryCart == null
            ? null
            : List<dynamic>.from(listLaundryCart.map((x) => x.toJson())),
        "listFoodCart": listFoodCart == null
            ? null
            : List<dynamic>.from(listFoodCart.map((x) => x.toJson())),
      };
}

class Cart {
  Cart({
    this.id,
    this.dateCreated,
    this.dateClosed,
    this.roomId,
    this.roomSessionId,
    this.promo,
    this.discount,
    this.totalMoney,
    this.currency,
    this.userCreateBill,
    this.userCloseBill,
    this.type,
    this.isPaid,
    this.status,
    this.signatureImagePath,
    this.note,
  });

  int id;
  DateTime dateCreated;
  dynamic dateClosed;
  int roomId;
  int roomSessionId;
  String promo;
  int discount;
  int totalMoney;
  int currency;
  int userCreateBill;
  dynamic userCloseBill;
  int type;
  int isPaid;
  int status;
  String signatureImagePath;
  String note;

  factory Cart.fromRawJson(String str) => Cart.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["id"] == null ? null : json["id"],
        dateCreated: json["dateCreated"] == null
            ? null
            : DateTime.parse(json["dateCreated"]),
        dateClosed: json["dateClosed"],
        roomId: json["roomId"] == null ? null : json["roomId"],
        roomSessionId:
            json["roomSessionId"] == null ? null : json["roomSessionId"],
        promo: json["promo"] == null ? null : json["promo"],
        discount: json["discount"] == null ? null : json["discount"],
        totalMoney: json["totalMoney"] == null ? null : json["totalMoney"],
        currency: json["currency"] == null ? null : json["currency"],
        userCreateBill:
            json["userCreateBill"] == null ? null : json["userCreateBill"],
        userCloseBill: json["userCloseBill"],
        type: json["type"] == null ? null : json["type"],
        isPaid: json["isPaid"] == null ? null : json["isPaid"],
        status: json["status"] == null ? null : json["status"],
        signatureImagePath: json["signatureImagePath"] == null
            ? null
            : json["signatureImagePath"],
        note: json["note"] == null ? null : json["note"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "dateCreated":
            dateCreated == null ? null : dateCreated.toIso8601String(),
        "dateClosed": dateClosed,
        "roomId": roomId == null ? null : roomId,
        "roomSessionId": roomSessionId == null ? null : roomSessionId,
        "promo": promo == null ? null : promo,
        "discount": discount == null ? null : discount,
        "totalMoney": totalMoney == null ? null : totalMoney,
        "currency": currency == null ? null : currency,
        "userCreateBill": userCreateBill == null ? null : userCreateBill,
        "userCloseBill": userCloseBill,
        "type": type == null ? null : type,
        "isPaid": isPaid == null ? null : isPaid,
        "status": status == null ? null : status,
        "signatureImagePath":
            signatureImagePath == null ? null : signatureImagePath,
        "note": note == null ? null : note,
      };
}

class ListFoodCart {
  ListFoodCart({
    this.foodCartId,
    this.cartId,
    this.listFoodCartFoodId,
    this.foodPricing,
    this.foodcartsCurrency,
    this.status,
    this.promo,
    this.discount,
    this.option,
    this.number,
    this.foodId,
    this.name,
    this.englishName,
    this.description,
    this.imagePath,
    this.sku,
    this.prefixCode,
    this.categoryId,
    this.pricing,
    this.foodCurrency,
    this.foodUnit,
    this.isActive,
    this.priority,
  });

  int foodCartId;
  int cartId;
  int listFoodCartFoodId;
  int foodPricing;
  int foodcartsCurrency;
  int status;
  dynamic promo;
  dynamic discount;
  dynamic option;
  int number;
  int foodId;
  String name;
  String englishName;
  String description;
  String imagePath;
  dynamic sku;
  dynamic prefixCode;
  int categoryId;
  int pricing;
  int foodCurrency;
  int foodUnit;
  int isActive;
  int priority;

  factory ListFoodCart.fromRawJson(String str) =>
      ListFoodCart.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListFoodCart.fromJson(Map<String, dynamic> json) => ListFoodCart(
        foodCartId: json["foodCartId"] == null ? null : json["foodCartId"],
        cartId: json["cartId"] == null ? null : json["cartId"],
        listFoodCartFoodId: json["foodId"] == null ? null : json["foodId"],
        foodPricing: json["foodPricing"] == null ? null : json["foodPricing"],
        foodcartsCurrency: json["foodcarts_currency"] == null
            ? null
            : json["foodcarts_currency"],
        status: json["status"] == null ? null : json["status"],
        promo: json["promo"],
        discount: json["discount"],
        option: json["option"],
        number: json["number"] == null ? null : json["number"],
        foodId: json["_foodId"] == null ? null : json["_foodId"],
        name: json["name"] == null ? null : json["name"],
        englishName: json["englishName"] == null ? null : json["englishName"],
        description: json["description"] == null ? null : json["description"],
        imagePath: json["imagePath"] == null ? null : json["imagePath"],
        sku: json["SKU"],
        prefixCode: json["prefixCode"],
        categoryId: json["categoryId"] == null ? null : json["categoryId"],
        pricing: json["pricing"] == null ? null : json["pricing"],
        foodCurrency:
            json["food_currency"] == null ? null : json["food_currency"],
        foodUnit: json["foodUnit"] == null ? null : json["foodUnit"],
        isActive: json["isActive"] == null ? null : json["isActive"],
        priority: json["priority"] == null ? null : json["priority"],
      );

  Map<String, dynamic> toJson() => {
        "foodCartId": foodCartId == null ? null : foodCartId,
        "cartId": cartId == null ? null : cartId,
        "foodId": listFoodCartFoodId == null ? null : listFoodCartFoodId,
        "foodPricing": foodPricing == null ? null : foodPricing,
        "foodcarts_currency":
            foodcartsCurrency == null ? null : foodcartsCurrency,
        "status": status == null ? null : status,
        "promo": promo,
        "discount": discount,
        "option": option,
        "number": number == null ? null : number,
        "_foodId": foodId == null ? null : foodId,
        "name": name == null ? null : name,
        "englishName": englishName == null ? null : englishName,
        "description": description == null ? null : description,
        "imagePath": imagePath == null ? null : imagePath,
        "SKU": sku,
        "prefixCode": prefixCode,
        "categoryId": categoryId == null ? null : categoryId,
        "pricing": pricing == null ? null : pricing,
        "food_currency": foodCurrency == null ? null : foodCurrency,
        "foodUnit": foodUnit == null ? null : foodUnit,
        "isActive": isActive == null ? null : isActive,
        "priority": priority == null ? null : priority,
      };
}

class ListLaundryCart {
  ListLaundryCart({
    this.laundryRequestId,
    this.cartId,
    this.listLaundryCartLaundryId,
    this.laundryPricing,
    this.requestCurrency,
    this.status,
    this.promo,
    this.discount,
    this.option,
    this.number,
    this.laundryId,
    this.name,
    this.englishName,
    this.description,
    this.imagePath,
    this.pricing,
    this.laundryCurrency,
    this.isActive,
  });

  int laundryRequestId;
  int cartId;
  int listLaundryCartLaundryId;
  int laundryPricing;
  int requestCurrency;
  int status;
  dynamic promo;
  dynamic discount;
  dynamic option;
  int number;
  int laundryId;
  String name;
  String englishName;
  String description;
  String imagePath;
  int pricing;
  int laundryCurrency;
  int isActive;

  factory ListLaundryCart.fromRawJson(String str) =>
      ListLaundryCart.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListLaundryCart.fromJson(Map<String, dynamic> json) =>
      ListLaundryCart(
        laundryRequestId:
            json["laundryRequestId"] == null ? null : json["laundryRequestId"],
        cartId: json["cartId"] == null ? null : json["cartId"],
        listLaundryCartLaundryId:
            json["laundryId"] == null ? null : json["laundryId"],
        laundryPricing:
            json["laundryPricing"] == null ? null : json["laundryPricing"],
        requestCurrency:
            json["request_currency"] == null ? null : json["request_currency"],
        status: json["status"] == null ? null : json["status"],
        promo: json["promo"],
        discount: json["discount"],
        option: json["option"],
        number: json["number"] == null ? null : json["number"],
        laundryId: json["_laundryId"] == null ? null : json["_laundryId"],
        name: json["name"] == null ? null : json["name"],
        englishName: json["englishName"] == null ? null : json["englishName"],
        description: json["description"] == null ? null : json["description"],
        imagePath: json["imagePath"] == null ? null : json["imagePath"],
        pricing: json["pricing"] == null ? null : json["pricing"],
        laundryCurrency:
            json["laundry_currency"] == null ? null : json["laundry_currency"],
        isActive: json["isActive"] == null ? null : json["isActive"],
      );

  Map<String, dynamic> toJson() => {
        "laundryRequestId": laundryRequestId == null ? null : laundryRequestId,
        "cartId": cartId == null ? null : cartId,
        "laundryId":
            listLaundryCartLaundryId == null ? null : listLaundryCartLaundryId,
        "laundryPricing": laundryPricing == null ? null : laundryPricing,
        "request_currency": requestCurrency == null ? null : requestCurrency,
        "status": status == null ? null : status,
        "promo": promo,
        "discount": discount,
        "option": option,
        "number": number == null ? null : number,
        "_laundryId": laundryId == null ? null : laundryId,
        "name": name == null ? null : name,
        "englishName": englishName == null ? null : englishName,
        "description": description == null ? null : description,
        "imagePath": imagePath == null ? null : imagePath,
        "pricing": pricing == null ? null : pricing,
        "laundry_currency": laundryCurrency == null ? null : laundryCurrency,
        "isActive": isActive == null ? null : isActive,
      };
}
