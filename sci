package ike1;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
import java.util.Set;

public class sci {
	 public static void main(String[] args) {
	        try {
	            SubwaySystem subwaySystem = new SubwaySystem("C:\\Users\\86138\\Desktop\\大作业\\subway.txt");
	            Scanner scanner = new Scanner(System.in);
	            while (true) {
	                System.out.println("请选择操作:");
	                System.out.println("1. 识别地铁中转站");
	                System.out.println("2. 查找附近站点");
	                System.out.println("3. 查找所有路径");
	                System.out.println("4. 查找最短路径");
	                System.out.println("5. 计算乘车费用");
	                System.out.println("6. 计算不同票种的票价");
	                System.out.println("7. 退出");

	                int choice = scanner.nextInt();
	                scanner.nextLine(); // consume newline

	                switch (choice) {
case 1:Set<Station> transferStations = subwaySystem.getTransferStations();
	                        System.out.println("Transfer Stations: " + transferStations);
	                        break;

case 2:System.out.println("输入站点名称:");
	                        String stationName = scanner.nextLine();
	                        System.out.println("输入距离:");
	                        double distance = scanner.nextDouble();
	                        scanner.nextLine(); // consume newline

	                        try {
	                            Map<Station, Double> nearbyStations = subwaySystem.getNearbyStations(stationName, distance);
	                            System.out.println("Nearby Stations: " + nearbyStations);
	                        } catch (IllegalArgumentException e) {
	                            System.out.println(e.getMessage());
	                        }
	                        break;

case 3: System.out.println("输入起点站:");
	                        String startStation = scanner.nextLine();
	                        System.out.println("输入终点站:");
	                        String endStation = scanner.nextLine();

	                        try {
	                            List<List<Station>> allPaths = subwaySystem.getAllPaths(startStation, endStation);
	                            System.out.println("All Paths: " + allPaths);
	                        } catch (IllegalArgumentException e) {
	                            System.out.println(e.getMessage());
	                        }
	                        break;

case 4: System.out.println("输入起点站:");
	                        startStation = scanner.nextLine();
	                        System.out.println("输入终点站:");
	                        endStation = scanner.nextLine();

	                        try {
	                            List<Station> shortestPath = subwaySystem.getShortestPath(startStation, endStation);
	                            System.out.println("Shortest Path: " + shortestPath);
	                            subwaySystem.printPath(shortestPath);
	                        } catch (IllegalArgumentException e) {
	                            System.out.println(e.getMessage());
	                        }
	                        break;

case 5:System.out.println("输入起点站:");
	                        startStation = scanner.nextLine();
	                        System.out.println("输入终点站:");
	                        endStation = scanner.nextLine();

	                        try {
	                            List<Station> path = subwaySystem.getShortestPath(startStation, endStation);
	                            double fare = subwaySystem.calculateFare(path);
	                            System.out.println("Fare: " + fare);
	                        } catch (IllegalArgumentException e) {
	                            System.out.println(e.getMessage());
	                        }
	                        break;
case 6: System.out.println("输入起点站:");
	                        startStation = scanner.nextLine();
	                        System.out.println("输入终点站:");
	                        endStation = scanner.nextLine();
	                        System.out.println("输入票种 (普通, 武汉通, 日票):");
	                        String ticketType = scanner.nextLine();

	                        try {
	                            List<Station> path = subwaySystem.getShortestPath(startStation, endStation);
	                            double discountedFare = subwaySystem.calculateFareWithDiscount(path, ticketType);
	                            System.out.println("Discounted Fare (" + ticketType + "): " + discountedFare);
	                        } catch (IllegalArgumentException e) {
	                            System.out.println(e.getMessage());
	                        }
	                        break;

case 7: scanner.close();
	                        return;

	                    default:
	                        System.out.println("无效选择，请重新选择。");
	                }

  } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }
}
