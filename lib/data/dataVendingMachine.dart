class DataVendingMachine
{

  static const List acceptableMoney = [
    {
      "label": "2000",
      "withNumberFormat": "2.000"
    },
    {
      "label": "5000",
      "withNumberFormat": "5.000"
    },
    {
      "label": "10000",
      "withNumberFormat": "10.000"
    },
    {
      "label": "20000",
      "withNumberFormat": "20.000"
    }
  ];
  
  static const List sellItems = [
    {
      "id": "1",
      "label": "Aqua",
      "price": [
        {
          "noCurrency": "5000",
          "withCurrency": "Rp 5.000"
        }
      ],
      "availability": [
        {
          "status": true,
          "stock": "1"
        }
      ],
      "urlPhoto": "https://ecs7.tokopedia.net/img/cache/700/product-1/2018/5/10/3347380/3347380_d5e99949-da1c-456e-97eb-04082149d37d_960_1212.jpg",
      "padding": 20.0
    },
    {
      "id": "2",
      "label": "Teh Botol",
      "price": [
        {
          "noCurrency": "7000",
          "withCurrency": "Rp 7.000"
        }
      ],
      "availability": [
        {
          "status": true,
          "stock": "2"
        }
      ],
      "urlPhoto": "https://ecs7.tokopedia.net/img/cache/700/product-1/2020/8/26/41006724/41006724_8c79b801-9a65-4b6c-b690-ec46c8f91a5d_700_700.webp",
      "padding": 5.0
    },
    {
      "id": "3",
      "label": "Pocari Sewat",
      "price": [
        {
          "noCurrency": "10000",
          "withCurrency": "Rp 10.000"
        }
      ],
      "availability": [
        {
          "status": false,
          "stock": "0"
        }
      ],
      "urlPhoto": "https://ecs7.tokopedia.net/img/cache/700/product-1/2019/7/9/486244711/486244711_4dcddbd5-d79b-444e-a3f0-056daa88a0ae_720_720.jpg",
      "padding": 20.0
    }
  ];

}