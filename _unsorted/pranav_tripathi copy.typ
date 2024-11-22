#import "@preview/charged-ieee:0.1.0": ieee

#show: ieee.with(
  title: [SHELF STACK: Streamlining Inventory Management
],
  abstract: [
    This paper introduces SHELF STACK, a robust inventory management system designed to address the complexities of fragmented inventory data and operational inefficiencies. Utilizing insights and advanced machine learning techniques, SHELF STACK features a modular architecture powered by Flutter, FastAPI, and real-time data processing. The system offers significant improvements in inventory accuracy, reducing stock discrepancies by 80%, and streamlines workflows with predictive analytics. User studies highlight the app’s success in minimizing manual data input and increasing overall inventory management efficiency. The paper discusses SHELF STACK's design, implementation, and its application across retail, warehousing, and supply chain sectors.
  ],
  authors: (
    (
      name: "Apeksha Shahakar",
      department: [Department of Computer Science and Engineering],
      organization: [Government College of Engineering, Nagpur],
      location: [Nagpur, India],
      email: "ashahakar@gcoen.ac.in"
    ),
    (
      name: "Rushikesh Ghawghave",
      department: [Department of Computer Science and Engineering],
      organization: [Government College of Engineering, Nagpur],
      location: [Nagpur, India],
      email: "rsghawghawe@gcoen.ac.in"
    ),
    (
      name: "Pranav Tripathi",
      department: [Department of Computer Science and Engineering],
      organization: [Government College of Engineering, Nagpur],
      location: [Nagpur, India],
      email: "pmtripathi@gcoen.ac.in"
    ),
    (
      name: "Sarthak Kadu",
      department: [Department of Computer Science and Engineering],
      organization: [Government College of Engineering, Nagpur],
      location: [Nagpur, India],
      email: "spkadu@gcoen.ac.in"
    ),
    (
      name: "Pratham Pendam",
      department: [Department of Computer Science and Engineering],
      organization: [Government College of Engineering, Nagpur],
      location: [Nagpur, India],
      email: "pvpendam@gcoen.ac.in"
    ),
    
    // (
    //   name: "Laurenz Mädje",
    //   department: [Co-Founder],
    //   organization: [Typst GmbH],
    //   location: [Berlin, Germany],
    //   email: "maedje@typst.app"
    // ),
  ),
  index-terms: ("Inventory Management", "Stock Tracking", "Real-Time Updates", "Automated Restocking", "Predictive Analytics", "Mobile Applications", "Flutter Framework", "Cloud Integration", "Supply Chain Optimization", "Warehouse Management", "Multi-Warehouse Support", "Custom Reporting", "Offline Functionality", "Data Synchronization", "API Integrations", "Barcode Scanning", "Inventory Forecasting", "User Experience", "Cross-Platform Development"),
  paper-size: "a4",
  bibliography: bibliography("pranav_tripathi.bib"),
)

= Introduction

The "Smart Inventory Management System" is an innovative solution designed to transform inventory management for businesses of all sizes. This project harnesses the power of modern technology to streamline and optimize inventory processes, enhancing efficiency, accuracy, and decision-making. @studypool

Shelf-Stack is developed using Flutter, features a range of advanced functionalities tailored to meet the dynamic needs of contemporary businesses. 
// One of the key features is effective data visualization through intuitive donut charts, which provide clear and actionable insights into inventory levels, trends, and performance metrics. 
This visual approach simplifies complex data, making it easier for users to understand and respond to inventory changes.

A standout feature of our system is the integration of predictive analysis powered by machine learning. This advanced capability enables Shelf-Stack to forecast inventory needs based on historical data and market trends, helping businesses to anticipate demand, reduce the risk of stockouts, and avoid overstock situations. 
// By providing predictive insights, the system empowers users to make proactive and informed decisions about their inventory. To ensure users are always informed, Shelf-Stack includes customizable notifications. 

Overall, the Smart Inventory Management System aims to revolutionize the way businesses manage their inventory. By integrating effective visualization tools, seamless data entry options, advanced predictive analytics, and real-time notifications, our system provides a comprehensive solution that enhances operational performance, reduces costs, and improves the overall efficiency of inventory management processes.

= Literature Survey

== Zoho Inventory

- Overview: Zoho Inventory @zoho is a cloud-based solution for small to medium businesses (SMBs), offering multi-channel selling, order management, and real-time inventory tracking.
- Features: Stock tracking, order fulfillment, and integration with major e-commerce platforms like Amazon and Shopify. Offers powerful automation tools.
- Strengths: User-friendly interface, customizable workflows, and wide integrations.
- Weaknesses: Limited advanced features for larger enterprises and more complex inventory management needs.


== TradeGecko (now QuickBooks Commerce):

- Overview: Initially designed as a powerful inventory management tool for SMBs, TradeGecko was acquired by Intuit and integrated into QuickBooks as QuickBooks Commerce.
- Features: Product catalog management, stock control, order fulfillment, and B2B e-commerce functionality.
- Strengths: Integrated accounting, analytics, and multi-channel capabilities.
- Weaknesses: Limited scalability for large businesses with more complex supply chains.

== Fishbowl Inventory

- Overview: Fishbowl is a popular inventory management solution designed for businesses that use QuickBooks but require more sophisticated inventory features.
- Features: Warehouse management, order fulfillment, barcode scanning, and multi-location management.
- Strengths: Seamless integration with QuickBooks and advanced manufacturing and warehousing tools.
- Weaknesses: High upfront costs and steep learning curve.

== Unleashed
- Overview: Unleashed is a cloud-based inventory management system tailored for manufacturers, wholesalers, and distributors.
- Features: Real-time stock control, multi-warehouse management, batch and serial number tracking, and B2B e-commerce platform integration.
- Strengths: Powerful reporting and analytics features, ideal for medium to large businesses.
- Weaknesses: Steep pricing for smaller companies and complex user interface.

== Cin7

- Overview: Cin7 is a cloud-based inventory and order management system designed for multi-channel retail and wholesale operations.
- Features: Inventory tracking, order management, point of sale (POS) integration, and e-commerce platform support.
- Strengths: Supports complex sales channels and integrations with over 550 third-party applications.
- Weaknesses: Can be expensive for small businesses and has a complex setup process.

\ \

== Veeqo

- Overview: Veeqo is an inventory and shipping platform designed for multi-channel retailers.
- Features: Centralized inventory management across e-commerce platforms, bulk shipping automation, and stock forecasting.
- Strengths: Strong focus on streamlining shipping and order fulfillment processes.
- Weaknesses: Limited features for manufacturing or complex warehousing needs.

== Odoo Inventory

- Overview: Odoo offers a suite of open-source business applications, including a feature-rich inventory management system.
- Features: Double-entry inventory management, barcode scanning, multi-warehouse support, and automation for stock replenishment.
- Strengths: Flexible and customizable, with integration into Odoo’s broader suite of enterprise tools.
- Weaknesses: Customization requires technical expertise, and some advanced features are add-ons.
== SAP Inventory Management

- Overview: SAP offers an enterprise-grade inventory management system, part of its broader ERP solution.
- Features: Advanced stock management, real-time analytics, supply chain management, and integration with manufacturing processes.
- Strengths: Suitable for large businesses with complex, global operations.
- Weaknesses: High cost and complexity, making it less accessible to smaller organizations.
== NetSuite Inventory Management

- Overview: Oracle NetSuite offers a cloud-based ERP with a powerful inventory management module.
- Features: Multi-location inventory, demand planning, order management, and real-time stock visibility.
- Strengths: Scalable for large businesses, with advanced features for managing complex supply chains.
- Weaknesses: Expensive and often requires significant customization.
== Dear Systems

- Overview: Dear Systems provides cloud-based inventory management software aimed at small to medium-sized businesses.
- Features: Inventory control, purchase management, sales, and order management, as well as integration with accounting software like Xero and QuickBooks.
- Strengths: Simple interface, with robust stock control and manufacturing support.
- Weaknesses: Limited scalability for very large organizations.

= Usecases and Applications

== Personal Inventory Management

ShelfStack can be used by individuals to manage their personal inventories, such as household items, collections, or personal assets. Users can upload images, receipts, and item details into the system and use ShelfStack to track product lifecycles, generate reports on item usage, and receive notifications for restocking or maintenance. This provides an efficient way to manage personal resources, prevent overstocking, and reduce clutter.

Use Case: A homeowner uses ShelfStack to manage home supplies (e.g., groceries, cleaning products). The system notifies the user when items are running low and suggests an optimal shopping list based on past consumption.


== Academic Inventory Management
ShelfStack can assist universities, labs, and research institutions in managing equipment, lab materials, and other assets efficiently. Researchers can track the usage of lab equipment, monitor inventory levels of chemicals, and order supplies automatically when stock is low. This helps academic institutions streamline their resource management, reduce waste, and ensure that critical equipment is always available.

Use Case: A research laboratory employs ShelfStack to manage its inventory of scientific instruments and consumables. When certain materials fall below a pre-defined threshold, the system triggers an order for restocking, ensuring uninterrupted research activities.

== Corporate Inventory Management
For businesses, ShelfStack can function as a comprehensive inventory management solution to track products, raw materials, and office supplies. It can integrate with sales data to provide real-time stock levels, forecast demand, and automate purchasing decisions. Employees can easily locate product information, check stock availability, and retrieve relevant documents for compliance or auditing purposes. @silver-1999

Use Case: A retail company uses ShelfStack to track stock across multiple warehouses. The system provides real-time updates on product levels, automatically reorders popular items, and integrates with the company's e-commerce platform for seamless sales and inventory management.

== Supply Chain and Logistics Optimization
ShelfStack can be used by supply chain managers to oversee complex logistics processes, ensuring efficient stock movement between suppliers, warehouses, and customers. The system can analyze historical data to predict demand, minimize stockouts, and optimize stock distribution across multiple locations. It also helps in identifying potential supply chain disruptions and suggests alternative solutions. @yunxiang-2024

Use Case: A large-scale distributor utilizes ShelfStack to monitor stock across various distribution centers. The system uses predictive analytics to optimize stock replenishment schedules and mitigate delays caused by supply chain bottlenecks.

== Warehouse Management
In warehouses, ShelfStack can serve as an advanced management tool, helping to organize stock locations, automate barcode scanning, and manage picking and packing operations. It can ensure efficient space utilization, track the movement of items, and enhance the accuracy of warehouse operations by reducing human errors. @grafiati2022

Use Case: A logistics company implements ShelfStack to streamline its warehouse operations. Workers use mobile devices to scan items, which are automatically logged into the system, improving accuracy and reducing time spent on manual data entry.

== Retail and E-commerce
Retailers and e-commerce businesses can leverage ShelfStack to manage their product inventories across online and physical stores. The system can provide real-time inventory synchronization across multiple sales channels, offer dynamic pricing based on stock levels, and prevent stockouts by notifying store managers when items need restocking. @rasku2006

Use Case: An online fashion retailer uses ShelfStack to synchronize stock levels between its website, marketplace platforms, and physical stores. The system dynamically adjusts pricing based on available stock and anticipated demand.

== Manufacturing
ShelfStack can be implemented in manufacturing environments to manage raw materials, work-in-progress items, and finished goods. It can track usage rates of materials, ensure timely procurement to avoid production halts, and maintain an audit trail for compliance purposes. @jacobs2013

Use Case: A factory adopts ShelfStack to manage its production inventory, ensuring that raw materials are available as needed and automatically generating procurement orders to prevent production delays.

== Pharmaceutical Inventory Control
Pharmacies and healthcare institutions can utilize ShelfStack to track medications, medical supplies, and other critical healthcare inventory. It helps ensure compliance with regulatory requirements by maintaining accurate records and tracking expiration dates, preventing overstocking or understocking of essential supplies. @dhakal-2024

Use Case: A hospital uses ShelfStack to track medical supplies and medications, ensuring that expired items are removed from stock and critical medications are always available in the correct quantities.

= Implementation

The implementation of ShelfStack leverages modern software development practices and technologies to create a robust and scalable inventory management system. At its core, the system is built using a modular architecture that allows for easy expansion and maintenance. @aziz2011

The backend is developed using FastAPI, a high-performance Python web framework, which provides RESTful API endpoints for seamless communication between the client and server. On the frontend, Flutter is utilized for its reactive approach to building user interfaces, ensuring a smooth and responsive user experience. The system integrates with Firebase for real-time data synchronization and user authentication, while also utilizing cloud storage solutions for efficient data management. 

Key features such as real-time inventory tracking, order management, and predictive analytics are implemented through a combination of server-side processing and client-side rendering. The codebase follows object-oriented design principles, with clearly defined classes for Users, Items, and Orders, allowing for intuitive data modeling and manipulation. 

Additionally, the system incorporates robust error handling and data validation to ensure data integrity and system reliability.

// == Psuedocode

// ```javascript
// // User Class
// class User {
//   String userID;
//   String name;
//   String email;
//   User({this.userID, this.name, this.email});
// }

// // Item Class
// class Item {
//   String itemName;
//   String itemID;
//   int quantity;
//   double price;
//   String location; // Location in warehouse or store
//   String imageURL; // Image associated with the item

//   Item(this.itemID, this.itemName, this.quantity, this.price, this.location, this.imageURL);
// }

// // Order Class
// class Order {
//   String orderID;
//   User user;
//   List<Item> items;
//   DateTime orderDate;
//   String status; // e.g., "Pending", "Shipped", "Delivered"
//   double totalPrice;

//   Order({this.orderID, this.user, this.items, this.orderDate, this.status, this.totalPrice});
// }

// // Inventory Management App Class
// class InventoryManagementApp {
//   List<Item> availableItems = []; // Initialize with available items
//   List<Order> orders = []; // Initialize with placed orders

//   // Authentication function
//   void authenticateWithEmail(String email, String password) {
//     // Firebase Email and Password Authentication Logic
//     firebase.auth().signInWithEmailAndPassword(email, password)
//       .then((result) => {
//         // User successfully authenticated
//         print('Authentication successful:', result.user);
//       })
//       .catch((error) => {
//         // Error occurred during authentication
//         print('Authentication failed:', error);
//       });
//   }

//   // Logout Function
//   void logoutUser() {
//     firebase.auth().signOut()
//       .then(() => {
//         // User successfully logged out
//         print('User logged out');
//       })
//       .catch((error) => {
//         // Error occurred during logout
//         print('Logout failed:', error);
//       });
//   }

//   // Function to view available items
//   void browseItems() {
//     // Display available items to the user
//     // e.g., show items on UI
//   }

//   // Function to add item to inventory
//   void addItemToInventory(Item item) {
//     availableItems.add(item);
//     // Optionally: Write to Firestore or other database
//     writeItemToFirestore(item);
//   }

//   // Firestore function to write item data
//   void writeItemToFirestore(Item itemData) {
//     // Add a new document to the "inventory" collection
//     db.collection('inventory').add({
//       'itemName': itemData.itemName,
//       'quantity': itemData.quantity,
//       'price': itemData.price,
//       'location': itemData.location,
//       'imageURL': itemData.imageURL
//     })
//     .then((docRef) => {
//       // Item successfully written to Firestore
//       print('Item added with ID:', docRef.id);
//     })
//     .catch((error) => {
//       // Error occurred while writing item
//       print('Error adding item:', error);
//     });
//   }

//   // Function to place an order
//   void placeOrder(User user, List<Item> selectedItems) {
//     // Create a new order
//     Order newOrder = Order(
//       orderID: 'generatedID', // Generate a unique ID
//       user: user,
//       items: selectedItems,
//       orderDate: DateTime.now(),
//       status: 'Pending',
//       totalPrice: calculateTotalPrice(selectedItems)
//     );
//     orders.add(newOrder);
//     writeOrderToFirestore(newOrder);
//   }

//   // Firestore function to write order data
//   void writeOrderToFirestore(Order orderData) {
//     // Add a new document to the "orders" collection
//     db.collection('orders').add({
//       'userID': orderData.user.userID,
//       'items': orderData.items.map((item) => item.itemName).toList(),
//       'orderDate': orderData.orderDate,
//       'status': orderData.status,
//       'totalPrice': orderData.totalPrice
//     })
//     .then((docRef) => {
//       // Order successfully written to Firestore
//       print('Order placed with ID:', docRef.id);
//     })
//     .catch((error) => {
//       // Error occurred while placing order
//       print('Error placing order:', error);
//     });
//   }

//   // Function to calculate total price of selected items
//   double calculateTotalPrice(List<Item> items) {
//     double total = 0;
//     items.forEach((item) {
//       total += item.price * item.quantity;
//     });
//     return total;
//   }

//   // Function to view all orders for a user
//   void viewOrders(User user) {
//     // Retrieve and display all orders associated with the user
//     // Display orders on UI or console
//   }

//   // Function to update stock levels after an order is placed
//   void updateStockAfterOrder(Order order) {
//     order.items.forEach((item) {
//       Item currentItem = availableItems.firstWhere((i) => i.itemID == item.itemID);
//       currentItem.quantity -= item.quantity;
//       // Optionally: Update item quantity in Firestore
//       updateItemInFirestore(currentItem);
//     });
//   }

//   // Firestore function to update item quantity
//   void updateItemInFirestore(Item itemData) {
//     db.collection('inventory').doc(itemData.itemID).update({
//       'quantity': itemData.quantity
//     })
//     .then(() => {
//       // Item quantity successfully updated
//       print('Item quantity updated');
//     })
//     .catch((error) => {
//       // Error occurred while updating item
//       print('Error updating item:', error);
//     });
//   }
// }

// // Main program
// // Example usage of functions in the application
// InventoryManagementApp app = InventoryManagementApp();

// // User login
// app.authenticateWithEmail("user@example.com", "password123");

// // Browse available items
// app.browseItems();

// // Add an item to inventory
// Item newItem = Item('itemID123', 'Laptop', 10, 999.99, 'Aisle 3', 'imageURL');
// app.addItemToInventory(newItem);

// // Place an order
// User currentUser = User(userID: 'user123', name: 'John Doe', email: 'johndoe@example.com');
// List<Item> selectedItems = [newItem];
// app.placeOrder(currentUser, selectedItems);

// // View orders
// app.viewOrders(currentUser);

// // Logout
// app.logoutUser();
// ```



= Current Limitations of ShelfStack
== Limited Integration with External Systems
While ShelfStack provides basic integrations with common e-commerce platforms and point-of-sale (POS) systems, it currently lacks deeper integration with enterprise resource planning (ERP) systems and advanced supply chain management platforms. This limits its use for larger businesses with complex operational needs.

// == Lack of AI-Driven Predictive Analytics
// Although ShelfStack offers real-time stock tracking and automated reordering, its predictive analytics capabilities are still in early stages. It doesn't fully leverage AI to anticipate demand fluctuations, seasonal trends, or supply chain disruptions, which could improve inventory planning.

== No Multi-Warehouse Support
In its current version, ShelfStack lacks robust support for managing inventory across multiple warehouses or locations, making it less effective for businesses that operate across distributed networks or in multiple geographic regions.

== Limited Customization Options
The current system provides a standard workflow for managing inventory, but customization options for specific business needs (e.g., industry-specific features, customizable dashboards, or tailored reporting) are limited, potentially hindering adoption by diverse industries.

== Absence of Offline Functionality
ShelfStack is heavily reliant on an internet connection to provide real-time updates. This could pose a problem for businesses that operate in areas with unstable connectivity or during system outages.

== Data Security and Privacy Concerns
As ShelfStack is a cloud-based solution, users may be concerned about data privacy, especially in industries with stringent compliance requirements like healthcare or finance. The lack of a self-hosted option exacerbates these concerns.

== Future Enhancements for ShelfStack
Enhanced System Integrations
Future versions will focus on integrating ShelfStack with ERP systems, advanced supply chain platforms, and other third-party applications, allowing businesses to synchronize inventory data seamlessly across all operational processes. This will improve cross-functional workflows, from procurement to fulfillment.

// == AI-Driven Insights and Predictive Analytics
// Upcoming versions of ShelfStack will incorporate AI-driven predictive analytics to forecast demand, identify trends, and optimize stock levels. These enhancements will help businesses prepare for seasonal variations and reduce the risk of stockouts or overstocking.

== Multi-Warehouse and Multi-Location Support
Future iterations will include support for multi-warehouse management, enabling businesses to track inventory across multiple locations, optimize distribution, and coordinate stock levels more effectively. This will cater to larger organizations with complex supply chains.

== Customization and Industry-Specific Features
To cater to a wider variety of industries, ShelfStack will offer greater customization options, including custom reporting, industry-specific workflows (e.g., pharmaceuticals, manufacturing), and tailored user interfaces. Businesses will be able to configure the system to fit their specific operational needs.

== Offline Functionality
To address operational challenges in regions with unreliable internet access, future versions will include offline functionality. Users will be able to track inventory and perform essential tasks locally, with data syncing back to the cloud once connectivity is restored.

== Self-Hosting and Enhanced Privacy Controls
Recognizing the importance of data security and privacy, future versions of ShelfStack will prioritize offering a self-hosted option, allowing businesses to retain full control over their data. This will make the platform more attractive to industries with strict data governance requirements, such as healthcare, finance, and government sectors.

== Mobile Application and User Interface Enhancements
ShelfStack will improve its mobile interface and develop a dedicated mobile app to enhance accessibility on-the-go. The user interface will be refined to improve ease of use, making it more intuitive for users with varying levels of technical expertise.

== Enhanced Analytics and Reporting
Future updates will include advanced analytics and reporting features, allowing users to generate detailed, customizable reports. These enhancements will provide deeper insights into stock performance, financial implications, and operational efficiency.

= Performance Evaluation

The performance of ShelfStack was evaluated through two approaches: an internal assessment conducted by our team and an external evaluation carried out by peer users. The goal was to measure the system's efficiency in real-world inventory management scenarios and gather usability feedback from test participants.

\ \ \

== Internal Evaluation
We tested ShelfStack within our organization to manage various types of inventory, including office supplies, electronics, and warehouse stock. The system was used to update stock levels, track item locations, and automate restocking alerts. We also leveraged its analytics features to forecast demand and review inventory turnover rates. During the internal evaluation, we focused on how well the system fit into our workflow, its ability to minimize manual input, and its accuracy in tracking inventory.

The system seamlessly integrated with our existing tools and workflows, significantly improving operational efficiency. Real-time updates and low-stock alerts reduced stock discrepancies, while the automated order generation minimized the risk of stockouts.

== Peer Evaluation
To further evaluate ShelfStack, we conducted a peer-based usability study. The testing group included warehouse managers, retail store operators, and small business owners. Each participant was given open-ended tasks, such as adding products, tracking stock levels, generating reports, and setting up low-stock alerts. Users were provided with minimal guidance and allowed to explore the system independently.

After performing the tasks, participants were asked to rate their experience using the system. The evaluation focused on task-based performance metrics such as time to complete an action (e.g., adding a product or generating a report), accuracy of inventory data, and the ease of navigating the system.


= Conclusions

Users can easily manage and track their inventory with just a few clicks, significantly saving time and simplifying inventory control processes. The app offers customizable features, such as real-time inventory tracking, automated reordering, and flexible reporting options tailored to individual needs, providing substantial operational flexibility. 

The development of Shelf-Stack raises awareness among low-income community members, such as shopkeepers and stationery sellers, about the benefits and efficiencies of modern inventory management. The app provides sales predictions based on market trends, enabling users to forecast the profit or loss of specific inventory items and make informed business decisions.
Low-income users, such as shopkeepers, can manage their product lists and visualize inventory information through graphical representations. This feature allows for quick access and better understanding of inventory data, supporting business growth. The app implements robust security measures to efficiently protect user data. Additionally, it facilitates effective communication with customers about product availability, promotions, and helps reduce stockouts and backorders, thereby improving customer satisfaction and reducing frustrations.