import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.settings)
            ),
        ],
      ),
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         const  Padding(
            padding:  EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Halo Bang Zhar!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                    'Full Stack Dev',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.lightBlue,
                      fontWeight: FontWeight.w500
                    ),
                    )
                  ],
                )
              ],
            ),
          ),
         const SizedBox(height: 20,),
         const  Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome to',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.amber,
                  fontWeight: FontWeight.w400
                ),
                ),
                Text(
                  'QRODE',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
         ),
          ),
          const SizedBox(height: 20,),
          Expanded(
           child:  GridView.count(
            crossAxisCount:2,
           children: [
            BuildButton(
              icon: Icons.qr_code, 
              label: 'Qr Code', 
              iconColor: Colors.white, 
              backgroundColor: Colors.blue, 
              onTap: (){
                Navigator.pushNamed(context, '/create');
              }),

               BuildButton(
              icon: Icons.qr_code_scanner, 
              label: 'Scanner', 
              iconColor: Colors.white, 
              backgroundColor: Colors.pink, 
              onTap: (){
                Navigator.pushNamed(context, '/scan');
              }),

               BuildButton(
              icon: Icons.send, 
              label: 'Send', 
              iconColor: Colors.white, 
              backgroundColor: Colors.orange, 
              onTap: (){}),

               BuildButton(
              icon: Icons.print, 
              label: 'Print', 
              iconColor: Colors.white, 
              backgroundColor: Colors.green, 
              onTap: (){})
           ],
           ),
           )
        ]
      ),
    );
  }
}

class BuildButton extends StatelessWidget {
  const BuildButton({
    super.key,
    required this.icon,
    required this.label,
    required this.iconColor,
    required this.backgroundColor,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final Color iconColor;
  final Color backgroundColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 170, 
        height: 170, 
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), 
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05), 
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: backgroundColor, // Warna latar ikon
                borderRadius: BorderRadius.circular(12), // Sudut membulat ikon
              ),
              padding: const EdgeInsets.all(35),
              child: Icon(
                icon,
                color: iconColor, // Warna ikon
                size: 40, // Ukuran ikon lebih besar
              ),
            ),
            const SizedBox(height: 15), // Jarak antara ikon dan teks
            Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16, // Ukuran teks
              ),
            ),
          ],
        ),
      ),
    );
  }
}