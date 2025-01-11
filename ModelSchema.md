# Polly Data Model Summary

## Core Entities & Relationships

### Poll (Main Entity)
- **Purpose**: Represents a survey/questionnaire
- **Key Fields**:
  - `id`: UUID (unique identifier)
  - `title`: String (poll question)
  - `info`: String (additional details)
  - `isMultipleChoice`: Boolean (allows multiple selections)
  - `createdAt`: Date (creation timestamp)
  - `expiryDate`: Date (when poll closes)
  - `isActive`: Boolean (poll status)
- **Relationships**:
  - `options`: One-to-Many → PollOption (ordered)

### PollOption
- **Purpose**: Individual choice in a poll
- **Key Fields**:
  - `id`: UUID
  - `text`: String (option description)
  - `image`: Binary (optional visual)
- **Relationships**:
  - `poll`: Many-to-One ← Poll
  - `votes`: One-to-Many → Vote

### Profile
- **Purpose**: User representation
- **Key Fields**:
  - `id`: UUID
  - `name`: String
  - `joinedDate`: Date
- **Relationships**:
  - `votes`: One-to-Many → Vote

### Vote
- **Purpose**: Records user's poll selections
- **Key Fields**:
  - `id`: UUID
  - `votedAt`: Date
- **Relationships**:
  - `options`: Many-to-One ← PollOption
  - `profile`: Many-to-One ← Profile

## Key Features
- Unique constraints on all IDs
- Ordered relationships for options and votes
- Bidirectional relationships for data integrity
- Binary data support for images
- Timestamp tracking for all major actions

## Common Workflows

1. **Creating a Poll**:
   ```
   Poll → PollOptions (1:Many)
   ```

2. **Casting a Vote**:
   ```
   Profile → Vote → PollOption
   ```

3. **Viewing Results**:
   ```
   Poll → PollOptions → Votes (count/details)
   ```

This model enables:
- Multiple choice or single choice polls
- Image-based poll options
- User vote tracking
- Poll expiration management
- Vote history per user