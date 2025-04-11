# 🔐 Secure Blockchain File Transfer System

A secure and decentralized file transfer system built with **Node.js**, **IPFS**, **AES-256 encryption**, **SHA-256 hashing**, and **blockchain technology**. This project is designed to enable secure inter-company file transfers with strict **role-based access control (RBAC)** and **company-domain validation**.

## 🚀 Features

### ✅ User Authentication
- Registration & Login
- SHA-256 integrity check on registration
- Bcrypt password hashing
- Blockchain + IPFS-backed credential validation

### 🏢 Company & Role-Based Access Control (RBAC)
- Company Admins can:
  - Create companies
  - Approve or reject user registration
  - Assign roles
- Users can:
  - Register under a company using a domain-verified email
  - Get access once approved by company admin

### 🗂️ Secure File Upload & Sharing
- AES-256 encryption before storing files
- SHA-256 hash to verify file integrity
- Encrypted file storage on **IPFS (via Pinata)**
- IPFS CID & file hash stored on blockchain for tamper-proof verification

### 🔐 End-to-End File Encryption
- Automatic AES-256 encryption before upload
- AES decryption available to approved users only
- Zero-Knowledge Proof-style privacy using hash-based verification

### 📡 Blockchain Integration
- Smart contract records:
  - IPFS CID
  - SHA-256 hash of the file
- Ensures tamper-proof logs for each file transfer

---

## 🛠️ Tech Stack

| Layer       | Tech Used                     |
|-------------|-------------------------------|
| Backend     | Node.js, Express              |
| Encryption  | AES-256, SHA-256              |
| Storage     | IPFS (Pinata)                 |
| Blockchain  | Ethereum / Hardhat (Custom)   |
| Auth        | bcrypt, RBAC, JWT (optional)  |

---

