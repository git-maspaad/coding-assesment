class DataVendingMachine
{

  static const List acceptableMoney = [
    {
      "label": "2000"
    },
    {
      "label": "5000"
    },
    {
      "label": "10000"
    },
    {
      "label": "20000"
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
      ]
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
      ]
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
      ]
    }
  ];

}